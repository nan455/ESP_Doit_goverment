"""Data viewing, editing, and upload routes."""
from flask import Blueprint, render_template, request, jsonify, redirect, url_for, session, send_file
import datetime
import pandas as pd
import io
import traceback
from werkzeug.utils import secure_filename
from app.utils.database import with_db_connection, log_error_db
from app.utils.validators import (
    is_audit_column,
    is_refno_column,
    resolve_year,
    fk_value_to_id,
)
from app.constants import LOOKUP_CONFIG
from app.utils.excel_helpers import load_metadata_for_table, generate_excel_template
from flask import current_app

data_bp = Blueprint("data", __name__)


@data_bp.route("/user_dashboard")
def user_dashboard():
    """User dashboard page."""
    if "username" not in session:
        return redirect(url_for("auth.login_page"))
    return render_template("user_dashboard.html")


@data_bp.route("/view_excel_data")
def view_excel_data():
    """View/edit table data page."""
    if "username" not in session:
        return redirect(url_for("auth.login_page"))

    table = request.args.get("table")
    mode = request.args.get("mode", "view")
    return render_template("view_excel_data.html", table=table, mode=mode)


@data_bp.route("/download_register_template")
@with_db_connection
def download_register_template(cursor, conn):
    """Download Excel template for a transaction table."""
    table = request.args.get("table")
    if not table:
        return jsonify({"error": "Missing table parameter"}), 400

    try:
        output = generate_excel_template(cursor, table, LOOKUP_CONFIG, {})
        filename = f"{table}_template.xlsx"

        return send_file(
            output,
            as_attachment=True,
            download_name=filename,
            mimetype="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        )

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        print(" ERROR (template):", e)
        print(tb)
        return jsonify({"error": "Template generation failed"}), 500


def _process_upload_transaction(cursor, conn, table, file_obj):
    """
    Process uploaded transaction Excel file.

    Enforces:
    - Duplicate detection BEFORE UPSERT
    - Popup confirmation when replace_existing is FALSE
    - upload_id mapping
    - is_approved reset to NULL
    """

    if "username" not in session:
        return {"error": "Unauthorized"}, 401

    replace_existing = (
        request.form.get("replace_existing", "false").lower() == "true"
    )

    # -------------------------------------------------
    # Load DB columns
    # -------------------------------------------------
    try:
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        db_cols = [c["Field"] for c in cols_info]
    except Exception as e:
        tb = traceback.format_exc()
        log_error_db(
            session.get("username"),
            request.path,
            str(e),
            tb,
            current_app.config["CONFIG_OBJ"]
        )
        return {"error": f"Target table error: {e}"}, 400

    # -------------------------------------------------
    # Read Excel
    # -------------------------------------------------
    try:
        df = pd.read_excel(file_obj)
    except Exception as e:
        tb = traceback.format_exc()
        log_error_db(
            session.get("username"),
            request.path,
            str(e),
            tb,
            current_app.config["CONFIG_OBJ"]
        )
        return {"error": f"Unable to read Excel: {e}"}, 400

    if df.empty:
        return {"error": "Uploaded file is empty"}, 400

    df.fillna("", inplace=True)

    # -------------------------------------------------
    # Metadata mapping
    # -------------------------------------------------
    header_to_col = load_metadata_for_table(cursor, table)
    for c in db_cols:
        header_to_col.setdefault(c.lower(), c)
        header_to_col.setdefault(c.replace("_", " ").lower(), c)

    parsed_rows = []

    # -------------------------------------------------
    # Parse Excel rows
    # -------------------------------------------------
    for _, row in df.iterrows():
        row_data = {}

        for header in df.columns:
            raw_val = row[header]
            if str(raw_val).strip() == "":
                continue

            key = header.strip().lower()
            col = header_to_col.get(key) or header_to_col.get(key.replace(" ", "_"))

            if not col or col not in db_cols:
                continue

            if col == "id" or is_audit_column(col) or is_refno_column(col):
                continue

            value = raw_val

            if col == "year_id":
                value = resolve_year(cursor, value)
            elif col.endswith("_id"):
                value = fk_value_to_id(cursor, col, value, LOOKUP_CONFIG)
            elif isinstance(value, str):
                value = value.strip() or None

            row_data[col] = value

        if row_data:
            parsed_rows.append(row_data)

    if not parsed_rows:
        return {"error": "No valid rows found to insert"}, 400

    # -------------------------------------------------
    # DUPLICATE CHECK 
    # -------------------------------------------------
    if not replace_existing:
        try:
            cursor.execute(f"SHOW INDEX FROM `{table}` WHERE Non_unique = 0")
            indexes = cursor.fetchall()

            unique_cols = [
                i["Column_name"]
                for i in indexes
                if i["Key_name"] != "PRIMARY"
            ]

            if unique_cols:
                sample = parsed_rows[0]
                where = []
                values = []

                for col in unique_cols:
                    if col in sample:
                        where.append(f"`{col}` = %s")
                        values.append(sample[col])

                if where:
                    sql = f"""
                        SELECT 1
                        FROM `{table}`
                        WHERE {' AND '.join(where)}
                        LIMIT 1
                    """
                    cursor.execute(sql, values)
                    if cursor.fetchone():
                        return {
                            "error": "Data already exists. Replace existing data?"
                        }, 409

        except Exception as e:
            tb = traceback.format_exc()
            log_error_db(
                session.get("username"),
                request.path,
                str(e),
                tb,
                current_app.config["CONFIG_OBJ"]
            )
            return {"error": "Duplicate validation failed"}, 500

    # -------------------------------------------------
    # INSERT + UPSERT (TRANSACTION)
    # -------------------------------------------------
    try:
        now = datetime.datetime.now()
        if replace_existing:
            cursor.execute("""
                DELETE FROM excel_uploads
                WHERE table_name = %s AND department = %s
            """, (table, session.get("department")))

        # ✅ insert new upload log
        cursor.execute(
            """
            INSERT INTO excel_uploads
            (filename, table_name, uploaded_by, department)
            VALUES (%s, %s, %s, %s)
            """,
            (
                secure_filename(file_obj.filename),
                table,
                session.get("username"),
                session.get("department"),
            ),
        )
        upload_id = cursor.lastrowid

        # ---- Check columns
        all_cols = set()
        for r in parsed_rows:
            all_cols.update(r.keys())

        if "upload_id" in db_cols:
            all_cols.add("upload_id")
        if "is_approved" in db_cols:
            all_cols.add("is_approved")
        if "updated_by" in db_cols:
            all_cols.add("updated_by")
        if "updated_date" in db_cols:
            all_cols.add("updated_date")

        all_cols = sorted(all_cols)

        insert_cols = ", ".join(f"`{c}`" for c in all_cols)
        placeholders = ", ".join(["%s"] * len(all_cols))

        update_cols = []
        for c in all_cols:
            if c.endswith("_num") or c in (
                "updated_by", "updated_date", "upload_id", "is_approved"
            ):
                update_cols.append(f"`{c}` = VALUES(`{c}`)")

        update_sql = ", ".join(update_cols)

        sql = f"""
            INSERT INTO `{table}` ({insert_cols})
            VALUES ({placeholders})
            ON DUPLICATE KEY UPDATE
            {update_sql}
        """

        values = []
        for r in parsed_rows:
            row = dict(r)
            row["upload_id"] = upload_id
            row["is_approved"] = None
            row["updated_by"] = session.get("username")
            row["updated_date"] = now

            values.append(tuple(row.get(c) for c in all_cols))

        cursor.executemany(sql, values)
        conn.commit()

        return {
            "message": f"{len(values)} rows uploaded successfully",
            "upload_id": upload_id
        }, 200

    except Exception as e:
        conn.rollback()
        tb = traceback.format_exc()
        log_error_db(
            session.get("username"),
            request.path,
            str(e),
            tb,
            current_app.config.get("CONFIG_OBJ")
        )
        return {"error": str(e)}, 500


@data_bp.route("/upload_transaction", methods=["POST"])
@with_db_connection
def upload_transaction(cursor, conn):
    """Upload transaction data from Excel."""
    table = request.form.get("table_name")
    file = request.files.get("file")

    if not table:
        return jsonify({"error": "Missing table_name"}), 400
    if not file:
        return jsonify({"error": "No file uploaded"}), 400

    res, code = _process_upload_transaction(cursor, conn, table, file)
    return jsonify(res), code


@data_bp.route("/upload_accident_register", methods=["POST"])
@with_db_connection
def upload_accident_register(cursor, conn):
    """Upload accident register data from Excel."""
    table = request.form.get("table_name")
    file = request.files.get("file")

    if not table:
        return jsonify({"error": "Missing table_name"}), 400
    if not file:
        return jsonify({"error": "No file uploaded"}), 400

    res, code = _process_upload_transaction(cursor, conn, table, file)
    return jsonify(res), code


@data_bp.route("/download_excel")
@with_db_connection
def download_excel(cursor, conn):
    """Download table data as Excel (hide selected columns)."""
    table = request.args.get("table")
    filename = request.args.get("filename", f"{table}.xlsx")

    # ✅ columns to hide sent from frontend
    hide_cols = request.args.get("hide_cols", "")
    hide_cols = [c.strip() for c in hide_cols.split(",") if c.strip()]

    try:
        cursor.execute(f"SELECT * FROM `{table}`")
        rows = cursor.fetchall()
        df = pd.DataFrame(rows)

        # ✅ Drop hidden columns safely
        if not df.empty and hide_cols:
            df.drop(columns=[c for c in hide_cols if c in df.columns], inplace=True)

        output = io.BytesIO()
        with pd.ExcelWriter(output, engine="xlsxwriter") as writer:
            df.to_excel(writer, index=False)
        output.seek(0)

        return send_file(
            output,
            as_attachment=True,
            download_name=filename,
            mimetype="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        )
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500



@data_bp.route("/uploads", methods=["GET"])
@with_db_connection
def uploads_list(cursor, conn):
    """Get list of uploads WITH STATUS - FIXED VERSION."""
    import json
    import decimal
    import datetime
    
    class CustomJSONEncoder(json.JSONEncoder):
        def default(self, obj):
            if isinstance(obj, (datetime.datetime, datetime.date)):
                return obj.isoformat()
            if isinstance(obj, decimal.Decimal):
                return float(obj)
            return super().default(obj)
    
    try:
        department = session.get("department")
        role = session.get("role")
        username = session.get("username")
        
        # print(f"\n🔍 [data.py] Loading uploads for: {username} ({role}) - Dept: {department}")
        
        #  CRITICAL FIX: Include status_ with CAST for consistent type
        if role == "admin":
            cursor.execute("""
                SELECT 
                    id, 
                    filename, 
                    table_name, 
                    updated_by, 
                    department, 
                    updated_date,
                    CAST(status_ AS SIGNED) as status_
                FROM excel_uploads 
                ORDER BY updated_date DESC
            """)
        else:
            dept = request.args.get("department") or department
            cursor.execute("""
                SELECT 
                    id, 
                    filename, 
                    table_name, 
                    updated_by, 
                    department, 
                    updated_date,
                    CAST(status_ AS SIGNED) as status_
                FROM excel_uploads 
                WHERE department=%s 
                ORDER BY updated_date DESC
            """, (dept,))
        
        rows = cursor.fetchall()
        
        # print(f"📊 Found {len(rows)} uploads")
        
        #  CONSISTENT STATUS NORMALIZATION
        for upload in rows:
            status = upload.get('status_')
            upload_id = upload.get('id')
            
            # print(f"   Upload #{upload_id}: status_ = {status} (type: {type(status)})")
            
            # Normalize status value
            if status is None or status == '' or status == 'NULL':
                normalized_status = None  # Pending
            elif status in [1, True, '1']:
                normalized_status = 1  # Approved
            elif status in [0, False, '0']:
                normalized_status = 0  # Rejected
            else:
                normalized_status = None
            
            # Add status text for display
            if normalized_status is None:
                upload['status_text'] = 'Pending'
                upload['status_class'] = 'pending'
            elif normalized_status == 1:
                upload['status_text'] = 'Approved'
                upload['status_class'] = 'approved'
            elif normalized_status == 0:
                upload['status_text'] = 'Rejected'
                upload['status_class'] = 'rejected'
            else:
                upload['status_text'] = 'Unknown'
                upload['status_class'] = 'unknown'
            
            # Ensure status_ is normalized
            upload['status_'] = normalized_status
            
            #  NEW STRICT PERMISSION LOGIC
            # RULE: Only PENDING uploads can be edited/deleted
            # RULE: Approved and Rejected uploads are VIEW-ONLY (locked)
            
            can_edit = False
            can_delete = False
            
            if normalized_status is None:
                #  PENDING - Can edit and delete based on role
                if role == "admin":
                    can_edit = True
                    can_delete = True
                elif role == "approver":
                    can_edit = True
                    can_delete = True
                elif role == "user":
                    # User can only edit/delete their own uploads
                    can_edit = True
                    can_delete = True
                    
            elif normalized_status == 1:
                #  APPROVED - LOCKED (view-only for everyone)
                # can_edit = False
                # can_delete = False
                
                #  BACKUP: Uncomment to allow admin to edit/delete approved
                if role == "admin":
                    can_edit = True
                    can_delete = True
                
            elif normalized_status == 0:
                #  REJECTED - LOCKED (view-only for everyone)
                # can_edit = False
                # can_delete = False
                
                #  BACKUP: Uncomment to allow admin to edit/delete rejected
                if role == "admin":
                    can_edit = True
                    can_delete = True
            
            upload['can_edit'] = can_edit
            upload['can_delete'] = can_delete
            # print(f"      → Status: {upload['status_text']}, Can Edit: {can_edit}, Can Delete: {can_delete}")

        
        return current_app.response_class(
            response=json.dumps(rows, cls=CustomJSONEncoder),
            status=200,
            mimetype="application/json",
        )
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f" Error in uploads_list: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500


# @data_bp.route("/uploads/<int:uid>", methods=["DELETE"])
# @with_db_connection
# def uploads_delete(cursor, conn, uid):
#     """Delete an upload record."""
#     cursor.execute(
#         "SELECT table_name, updated_by FROM excel_uploads WHERE id=%s",
#         (uid,),
#     )
#     rec = cursor.fetchone()
#     if not rec:
#         return jsonify({"error": "Not found"}), 404

#     if session.get("role") != "admin":
#         if rec["updated_by"] != session.get("username"):
#             return jsonify({"error": "Forbidden"}), 403

#     cursor.execute("DELETE FROM excel_uploads WHERE id=%s", (uid,))
#     conn.commit()
#     return jsonify({"message": "Deleted"})

@data_bp.route("/uploads/<int:upload_id>", methods=["DELETE"])
@with_db_connection
def uploads_delete(cursor, conn, upload_id):
    try:
        # 1️⃣ Fetch upload info
        cursor.execute(
            "SELECT table_name, department FROM excel_uploads WHERE id=%s",
            (upload_id,)
        )
        upload = cursor.fetchone()

        if not upload:
            return jsonify({"error": "Upload not found"}), 404

        table_name = upload["table_name"]

        # 2️⃣ Permission check
        if session.get("role") != "admin":
            if upload["department"] != session.get("department"):
                return jsonify({"error": "Permission denied"}), 403

        # 3️⃣ Check if table existed BEFORE upload (JSON)
        cursor.execute("""
            SELECT COUNT(*) AS cnt
            FROM information_schema.tables
            WHERE table_schema = DATABASE()
              AND table_name = %s
              AND create_time < (
                  SELECT uploaded_on FROM excel_uploads WHERE id = %s
              )
        """, (table_name, upload_id))

        existed_before = cursor.fetchone()["cnt"] > 0

        # 4️⃣ Delete logic
        if existed_before:
            # JSON upload → delete values only
            cursor.execute(f"DELETE FROM `{table_name}`")
        else:
            # Excel upload → drop table
            cursor.execute(f"DROP TABLE IF EXISTS `{table_name}`")
            print(f" Table {table_name} dropped as it was created by the upload.")

        # 5️⃣ Remove upload record
        cursor.execute(
            "DELETE FROM excel_uploads WHERE id=%s",
            (upload_id,)
        )

        conn.commit()
        return jsonify({"message": "Upload deleted successfully"})

    except Exception as e:
        conn.rollback()
        return jsonify({"error": str(e)}), 500
    
