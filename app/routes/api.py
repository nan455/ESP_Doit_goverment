"""API routes for data operations - FIXED STATUS DISPLAY."""
from flask import Blueprint, request, jsonify, session, send_file
import datetime
import decimal
import json
import io
import pandas as pd
import traceback
from app.utils.database import with_db_connection, log_error_db
from app.utils.validators import (
    is_audit_column,
    is_refno_column,
    resolve_year,
    fk_value_to_id,
)
from app.constants import LOOKUP_CONFIG, COLUMN_LABEL
from app.utils.excel_helpers import (
    load_metadata_for_table,
    generate_excel_template,
)
from werkzeug.utils import secure_filename
from flask import current_app

api_bp = Blueprint("api", __name__)


class CustomJSONEncoder(json.JSONEncoder):
    """Custom JSON encoder for datetime and Decimal."""
    def default(self, obj):
        if isinstance(obj, (datetime.datetime, datetime.date)):
            return obj.isoformat()
        if isinstance(obj, decimal.Decimal):
            return float(obj)
        return super().default(obj)


# @api_bp.route("/api/current_user")
# @with_db_connection
# def api_current_user(cursor, conn):
#     """Get current user profile."""
#     cursor.execute(
#         "SELECT id, username, department, role "
#         "FROM users WHERE username=%s",
#         (session.get("username"),),
#     )
#     return jsonify(cursor.fetchone())


@api_bp.route("/api/transaction_tables")
@with_db_connection
def api_transaction_tables(cursor, conn):
    """
    Returns list of registers from txn_registry for the
    logged-in user's department.
    """
    dept = session.get("department")
    if not dept:
        return jsonify([])

    try:
        cursor.execute("SHOW TABLES LIKE 'txn_registry'")
        if not cursor.fetchone():
            return jsonify([])

        cursor.execute(
            """
            SELECT report_id,
                   report_name AS label,
                   target_table_name AS table_name
            FROM txn_registry
            WHERE LOWER(department) = LOWER(%s)
            ORDER BY report_name
            """,
            (dept,),
        )
        rows = cursor.fetchall()
        return jsonify(rows)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify([])


@api_bp.route("/api/table_columns")
@with_db_connection
def api_table_columns(cursor, conn):
    """Get columns for a table."""
    table = request.args.get("table")
    try:
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols = [c["Field"] for c in cursor.fetchall()]
        return jsonify(cols)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 400


@api_bp.route("/api/primary_key")
@with_db_connection
def api_primary_key(cursor, conn):
    """
    Tell the front-end which column is the PRIMARY KEY.
    Needed because many tables use *_refno instead of 'id'.
    """
    table = request.args.get("table")
    if not table:
        return jsonify({"pk": None})

    try:
        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name='PRIMARY'")
        pk_res = cursor.fetchone()
        pk_col = pk_res["Column_name"] if pk_res else None
        return jsonify({"pk": pk_col})
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"pk": None})


@api_bp.route("/api/excel_data")
@with_db_connection
def api_excel_data(cursor, conn):
    """Get data from a table."""
    table = request.args.get("table")
    only_rejected = request.args.get("only_rejected") == "true"
    upload_id = request.args.get("upload_id")

    try:
        params = []
        sql = f"SELECT * FROM `{table}` WHERE 1=1"

        # ✅ filter by upload_id if present
        if upload_id:

            sql += " AND (upload_id = %s OR upload_id IS NULL)"
            params.append(upload_id)

        # ✅ show only rejected rows for user fix
        if only_rejected:
            sql += " AND is_approved = 0"

        # ordering
        cursor.execute(f"SHOW COLUMNS FROM `{table}` LIKE 'id'")
        has_id = cursor.fetchone()
        if has_id:
            sql += " ORDER BY id DESC"

        sql += " LIMIT 1000"
        cursor.execute(sql, tuple(params))
        rows = cursor.fetchall()

        return current_app.response_class(
            response=json.dumps(rows, cls=CustomJSONEncoder),
            status=200,
            mimetype="application/json",
        )

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500

@api_bp.route("/api/lookup")
@with_db_connection
def api_lookup(cursor, conn):
    """Get lookup values for a foreign key column."""
    from app.utils.validators import infer_master_table_from_fk, detect_master_id_and_desc
    
    col = request.args.get("col")
    master_override = request.args.get("master")

    if not col:
        return jsonify([])

    try:
        if col in LOOKUP_CONFIG:
            table_ref, desc_col, id_col = LOOKUP_CONFIG[col]
            cursor.execute(
                f"SELECT {id_col} AS id, {desc_col} AS name "
                f"FROM `{table_ref}` ORDER BY name"
            )
            return jsonify(cursor.fetchall())

        master_table = master_override or infer_master_table_from_fk(col)
        if not master_table:
            return jsonify([])

        id_col, desc_col = detect_master_id_and_desc(cursor, master_table)
        if not id_col or not desc_col:
            return jsonify([])

        cursor.execute(
            f"SELECT `{id_col}` AS id, `{desc_col}` AS name "
            f"FROM `{master_table}` ORDER BY name"
        )
        rows = cursor.fetchall()
        return jsonify(rows)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        print("❌ lookup error:", e)
        return jsonify({"error": str(e)}), 500


@api_bp.route("/api/column_metadata")
@with_db_connection
def api_column_metadata(cursor, conn):
    """Get column metadata for a table."""
    table = request.args.get("table")
    try:
        cursor.execute("""
            SELECT column_name, display_label
            FROM tbl_column_metadata
            WHERE table_name = %s
        """, (table,))
        rows = cursor.fetchall()
        # unify keys
        result = {}
        for r in rows:
            col = r.get("column_name") or r.get("col_name") or r.get("column")
            label = r.get("display_label") or r.get("displayname") or r.get("label") or ""
            if col:
                result[col] = label
        return jsonify(result)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({})


def user_can_edit_table(cursor, table_name: str) -> bool:
    """
    Very simple permission check.
    """
    if "username" not in session:
        return False
    if session.get("role") == "admin":
        return True

    dept = session.get("department")

    try:
        cursor.execute(
            "SELECT 1 FROM txn_registry "
            "WHERE LOWER(department)=LOWER(%s) AND target_table_name=%s LIMIT 1",
            (dept, table_name),
        )
        return cursor.fetchone() is not None
    except:
        return False


@api_bp.route("/api/update_excel_row", methods=["POST"])
@with_db_connection
def api_update_excel_row(cursor, conn):
    """Update a row in a table."""
    data = request.get_json(force=True)
    table = data.get("table")
    updates = data.get("updates")
    row_id = data.get("id")

    if not user_can_edit_table(cursor, table):
        return jsonify({"error": "Permission denied"}), 403

    try:
        set_clauses = []
        values = []
        pk_col = "id"

        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name='PRIMARY'")
        pk_res = cursor.fetchone()
        if pk_res:
            pk_col = pk_res["Column_name"]

        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        col_names = [c["Field"] for c in cols_info]

        for key, val in updates.items():
            if key not in col_names:
                continue
            if key == pk_col or is_audit_column(key):
                continue

            if isinstance(val, str):
                val = val.strip() or None

            if key == "year_id":
                val = resolve_year(cursor, val)
            elif key.endswith("_id"):
                val = fk_value_to_id(cursor, key, val, LOOKUP_CONFIG)

            set_clauses.append(f"`{key}` = %s")
            values.append(val)

        if not set_clauses:
            return jsonify({"error": "Nothing to update"}), 400

        values.append(row_id)
        sql = f"UPDATE `{table}` SET {', '.join(set_clauses)} WHERE `{pk_col}` = %s"
        cursor.execute(sql, tuple(values))
        conn.commit()

        return jsonify({"message": "Row updated"})
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        print(traceback.format_exc())
        return jsonify({"error": str(e)}), 500


@api_bp.route("/api/add_excel_row", methods=["POST"])
@with_db_connection
def api_add_excel_row(cursor, conn):
    """Add a new row to a table."""
    data = request.get_json(force=True)
    table = data.get("table")
    row_data = data.get("row_data") or {}

    if not user_can_edit_table(cursor, table):
        return jsonify({"error": "Permission denied"}), 403

    try:
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        db_cols = [c["Field"] for c in cols_info]

        insert_cols = []
        insert_vals = []
        placeholders = []

        # audit on insert
        if "created_by" in db_cols:
            insert_cols.append("created_by")
            insert_vals.append(session.get("username"))
            placeholders.append("%s")
        if "created_date" in db_cols:
            insert_cols.append("created_date")
            insert_vals.append(datetime.datetime.now())
            placeholders.append("%s")
        if "status_" in db_cols:
            insert_cols.append("status_")
            insert_vals.append(1)
            placeholders.append("%s")
        if "updated_by" in db_cols:
            insert_cols.append("updated_by")
            insert_vals.append(session.get("username"))
            placeholders.append("%s")
        if "updated_date" in db_cols:
            insert_cols.append("updated_date")
            insert_vals.append(datetime.datetime.now())
            placeholders.append("%s")

        # user-provided
        for col, val in row_data.items():
            if col not in db_cols:
                continue
            if col == "id" or is_audit_column(col):
                continue
            if isinstance(val, str):
                val = val.strip() or None

            if col == "year_id":
                val = resolve_year(cursor, val)
            elif col.endswith("_id"):
                val = fk_value_to_id(cursor, col, val, LOOKUP_CONFIG)

            insert_cols.append(col)
            insert_vals.append(val)
            placeholders.append("%s")

        if not insert_cols:
            return jsonify({"error": "No valid columns"}), 400

        sql = (
            f"INSERT INTO `{table}` ({', '.join('`'+c+'`' for c in insert_cols)}) "
            f"VALUES ({', '.join(['%s'] * len(insert_cols))})"
        )
        cursor.execute(sql, tuple(insert_vals))
        conn.commit()
        return jsonify({"message": "Row added", "id": cursor.lastrowid})
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        print(traceback.format_exc())
        return jsonify({"error": str(e)}), 500


@api_bp.route("/api/delete_excel_row", methods=["POST"])
@with_db_connection
def api_delete_excel_row(cursor, conn):
    """Delete a row from a table."""
    data = request.get_json(force=True)
    table = data.get("table")
    row_id = data.get("id")

    if not user_can_edit_table(cursor, table):
        return jsonify({"error": "Permission denied"}), 403

    try:
        # detect primary key
        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name='PRIMARY'")
        pk_res = cursor.fetchone()
        pk_col = pk_res["Column_name"] if pk_res else "id"

        sql = f"DELETE FROM `{table}` WHERE `{pk_col}`=%s"
        cursor.execute(sql, (row_id,))
        conn.commit()

        return jsonify({"message": "Row deleted"})
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        return jsonify({"error": str(e)}), 500
    


@api_bp.route("/uploads")
@with_db_connection
def get_uploads(cursor, conn):
    """Get uploads for current user's department - FIXED VERSION WITH CONSISTENT STATUS."""
    try:
        department = session.get("department")
        role = session.get("role")
        username = session.get("username")
        
        # print(f"\n🔍 Loading uploads for: {username} ({role}) - Dept: {department}")
        
        # ✅ CRITICAL FIX: Always include status_ in SELECT and ensure proper typing
        if role == "admin":
            cursor.execute("""
                SELECT 
                    id, 
                    filename, 
                    table_name, 
                    uploaded_by, 
                    department, 
                    uploaded_on,
                    CAST(is_approved AS SIGNED) as is_approved
                FROM excel_uploads 
                ORDER BY uploaded_on DESC
            """)
        else:
            cursor.execute("""
                SELECT 
                    id, 
                    filename, 
                    table_name, 
                    uploaded_by, 
                    department, 
                    uploaded_on,
                    CAST(is_approved AS SIGNED) as is_approved
                FROM excel_uploads 
                WHERE department = %s 
                ORDER BY uploaded_on DESC
            """, (department,))
        
        uploads = cursor.fetchall()
        
        # print(f"📊 Found {len(uploads)} uploads")
        
        # ✅ CONSISTENT STATUS HANDLING FOR ALL DASHBOARDS
        for upload in uploads:
            status = upload.get("is_approved")

            if status is None or status == '' or status == 'NULL':
                normalized = None
            elif status in [1, True, '1']:
                normalized = 1
            elif status in [0, False, '0']:
                normalized = 0
            else:
                normalized = None

            # text
            if normalized is None:
                upload["status_text"] = "Pending"
                upload["status_class"] = "pending"
            elif normalized == 1:
                upload["status_text"] = "Approved"
                upload["status_class"] = "approved"
            else:
                upload["status_text"] = "Rejected"
                upload["status_class"] = "rejected"

            upload["is_approved"] = normalized

            # permission
            can_edit = False
            can_delete = False

            if normalized is None:
                if role in ["admin", "approver"]:
                    can_edit = True
                    can_delete = True
                elif role == "user":
                    can_edit = (upload.get("uploaded_by") == username)
                    can_delete = (upload.get("uploaded_by") == username)

            elif normalized == 1:
                can_edit = False
                can_delete = False

            elif normalized == 0:
                # rejected: allow user fix
                if role in ["admin", "approver"]:
                    can_edit = True
                    can_delete = False
                elif role == "user":
                    can_edit = (upload.get("uploaded_by") == username)
                    can_delete = False

            upload["can_edit"] = can_edit
            upload["can_delete"] = can_delete

        # for upload in uploads:
        #     status = upload.get('status_')
        #     upload_id = upload.get('id')
            
        #     # Debug print
        #     # print(f"   Upload #{upload_id}: status_ = {status} (type: {type(status)})")
            
        #     # ✅ CRITICAL: Normalize status value to integer
        #     # Handle NULL, None, empty string, True/False, 0/1, "0"/"1"
        #     if status is None or status == '' or status == 'NULL':
        #         normalized_status = None  # Pending
        #     elif status in [1, True, '1']:
        #         normalized_status = 1  # Approved
        #     elif status in [0, False, '0']:
        #         normalized_status = 0  # Rejected
        #     else:
        #         normalized_status = None  # Default to pending
            
        #     # ✅ Add status_text for consistency across all dashboards
        #     if normalized_status is None:
        #         upload['status_text'] = 'Pending'
        #         upload['status_class'] = 'pending'
        #     elif normalized_status == 1:
        #         upload['status_text'] = 'Approved'
        #         upload['status_class'] = 'approved'
        #     elif normalized_status == 0:
        #         upload['status_text'] = 'Rejected'
        #         upload['status_class'] = 'rejected'
        #     else:
        #         upload['status_text'] = 'Unknown'
        #         upload['status_class'] = 'unknown'
            
        #     # ✅ Ensure status_ is set to normalized value for frontend
        #     upload['status_'] = normalized_status
            
        #     # ✅ NEW STRICT PERMISSION LOGIC
        #     # RULE: Only PENDING uploads can be edited/deleted
        #     # RULE: Approved and Rejected uploads are VIEW-ONLY (locked)
            
        #     can_edit = False
        #     can_delete = False
            
        #     if normalized_status is None:
        #         # ✅ PENDING - Can edit/delete based on role
        #         if role == "admin":
        #             can_edit = True
        #             can_delete = True
        #         elif role == "approver":
        #             can_edit = True
        #             can_delete = True
        #         elif role == "user":
        #             # User can only edit/delete their own uploads
        #             can_edit = (upload.get('uploaded_by') == username)
        #             can_delete = (upload.get('uploaded_by') == username)
                    
        #     elif normalized_status == 1:
        #         # ❌ APPROVED - LOCKED (view-only for everyone)
        #         can_edit = False
        #         can_delete = False
                
        #         # 💾 BACKUP: Uncomment to allow admin/approver override
        #         # if role == "admin":
        #         #     can_edit = True
        #         #     can_delete = True
        #         # elif role == "approver":
        #         #     can_edit = True
        #         #     can_delete = True
                
        #     elif normalized_status == 0:
        #         # ❌ REJECTED - LOCKED (view-only for everyone)
        #         can_edit = False
        #         can_delete = False
                
        #         # 💾 BACKUP: Uncomment to allow admin/approver override
        #         # if role == "admin":
        #         #     can_edit = True
        #         #     can_delete = True
        #         # elif role == "approver":
        #         #     can_edit = True
        #         #     can_delete = True
            
        #     upload['can_edit'] = can_edit
        #     upload['can_delete'] = can_delete
        #     # print(f"      → Status: {upload['status_text']}, Can Edit: {can_edit}, Can Delete: {can_delete}")

        
        return jsonify(uploads)
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error in get_uploads: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500

def user_can_edit_upload(cursor, upload_id: str, username: str, role: str) -> tuple:
    """
    Permission check based on excel_uploads.is_approved

    Rules:
    - Pending (is_approved IS NULL): editable (admin/approver + user-own)
    - Approved (is_approved = 1): LOCKED
    - Rejected (is_approved = 0): user can edit to fix and re-request reapproval
    """

    try:
        cursor.execute("""
            SELECT 
                id,
                uploaded_by,
                department,
                table_name,
                CAST(is_approved AS SIGNED) AS is_approved
            FROM excel_uploads
            WHERE id = %s
        """, (upload_id,))
        
        upload = cursor.fetchone()

        if not upload:
            return False, "Upload not found"

        appr = upload.get("is_approved")  # NULL / 1 / 0

        # ✅ APPROVED -> locked
        if appr == 1:
            return False, "Cannot edit approved uploads (locked)"

        # ✅ PENDING -> editable for admin/approver, user only if owner
        if appr is None:
            if role == "admin":
                return True, "Admin can edit pending uploads"
            if role == "approver":
                return True, "Approver can edit pending uploads"
            if role == "user":
                if upload.get("uploaded_by") == username:
                    return True, "User owns pending upload"
                return False, "Can only edit your own uploads"
            return False, "No permission"

        # ✅ REJECTED -> editable for user to fix (recommended)
        if appr == 0:
            if role == "admin":
                return True, "Admin can edit rejected uploads"
            if role == "approver":
                return True, "Approver can edit rejected uploads"
            if role == "user":
                if upload.get("uploaded_by") == username:
                    return True, "User can edit rejected upload (fix + reapproval)"
                return False, "Can only edit your own rejected uploads"
            return False, "No permission"

        return False, "Unknown approval state"

    except Exception as e:
        print(f"❌ Error checking edit permission: {e}")
        return False, str(e)



@api_bp.route("/api/can_edit_upload", methods=["POST"])
@with_db_connection
def api_can_edit_upload(cursor, conn):
    """Check if current user can edit an upload."""
    try:
        if "username" not in session:
            return jsonify({"can_edit": False, "reason": "Not authenticated"}), 401
        
        data = request.get_json()
        upload_id = data.get("upload_id")
        
        if not upload_id:
            return jsonify({"can_edit": False, "reason": "Missing upload_id"}), 400
        
        can_edit, reason = user_can_edit_upload(
            cursor,
            upload_id,
            session.get("username"),
            session.get("role")
        )
        
        return jsonify({
            "can_edit": can_edit,
            "reason": reason
        })
        
    except Exception as e:
        return jsonify({"can_edit": False, "reason": str(e)}), 500
    
@api_bp.route("/api/update_excel_cell", methods=["POST"])
@with_db_connection
def api_update_excel_cell(cursor, conn):
    """
    Update single cell (inline editing)

    RULES (FINAL):
    - USER can edit ONLY rejected rows → is_approved = 0
    - USER cannot update is_approved column
    - APPROVER/ADMIN can edit normal data columns
    """

    data = request.get_json(force=True)
    table = data.get("table")
    row_id = data.get("id")
    column = data.get("column")
    value = data.get("value")

    if not table or not row_id or not column:
        return jsonify({"error": "Missing table/id/column"}), 400

    if not user_can_edit_table(cursor, table):
        return jsonify({"error": "Permission denied"}), 403

    try:
        # ✅ detect primary key
        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name='PRIMARY'")
        pk_res = cursor.fetchone()
        pk_col = pk_res["Column_name"] if pk_res else "id"

        # ✅ validate column exists
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        col_names = [c["Field"] for c in cols_info]

        if column not in col_names:
            return jsonify({"error": "Invalid column"}), 400

        if column == pk_col or is_audit_column(column):
            return jsonify({"error": "Cannot edit this column"}), 400

        # =========================
        # ✅ USER RESTRICTIONS
        # =========================
        if session.get("role") == "user":

            # ❌ user cannot change approval column
            if column == "is_approved":
                return jsonify({"error": "You cannot change approval status"}), 403

            # ✅ check row approval state
            cursor.execute(
                f"SELECT is_approved FROM `{table}` WHERE `{pk_col}`=%s",
                (row_id,)
            )
            rr = cursor.fetchone()

            if not rr:
                return jsonify({"error": "Row not found"}), 404

            # ✅ ONLY rejected rows editable
            if rr.get("is_approved") != 0:
                return jsonify({
                    "error": "Only rejected rows can be edited"
                }), 403

        # =========================
        # ✅ FK conversion
        # =========================
        if column == "year_id":
            value = resolve_year(cursor, value)

        elif column.endswith("_id"):
            value = fk_value_to_id(cursor, column, value, LOOKUP_CONFIG)

        # =========================
        # ✅ update cell
        # =========================
        sql = f"""
            UPDATE `{table}`
            SET `{column}`=%s,
                updated_by=%s,
                updated_date=NOW()
            WHERE `{pk_col}`=%s
        """
        cursor.execute(sql, (value, session.get("username"), row_id))
        conn.commit()

        return jsonify({"message": "Cell updated"})

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(
                session.get("username"),
                request.path,
                str(e),
                tb,
                config_obj
            )
        conn.rollback()
        return jsonify({"error": str(e)}), 500

@api_bp.route("/api/set_row_status", methods=["POST"])
@with_db_connection
def api_set_row_status(cursor, conn):
    """
    Approver sets row approval ONLY using is_approved:

    is_approved = NULL  -> Pending
    is_approved = 1     -> Approved
    is_approved = 0     -> Rejected

    NOTE: status_ will NOT be updated anymore.
    """
    data = request.get_json(force=True)
    table = data.get("table")
    row_id = data.get("id")
    is_approved_val = data.get("status")  # frontend sends 1 / 0 / null

    if session.get("role") not in ["admin", "approver"]:
        return jsonify({"error": "Permission denied"}), 403

    if not table or not row_id:
        return jsonify({"error": "Missing table/id"}), 400

    try:
        # detect pk
        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name='PRIMARY'")
        pk_res = cursor.fetchone()
        pk_col = pk_res["Column_name"] if pk_res else "id"

        # normalize incoming
        if is_approved_val in [None, "", "null", "NULL"]:
            is_approved_val = None
        elif str(is_approved_val) == "1":
            is_approved_val = 1
        else:
            is_approved_val = 0

        sql = f"""
            UPDATE `{table}`
            SET is_approved=%s,
                updated_by=%s,
                updated_date=NOW()
            WHERE `{pk_col}`=%s
        """
        cursor.execute(sql, (is_approved_val, session.get("username"), row_id))
        conn.commit()

        return jsonify({"message": "Row approval updated", "is_approved": is_approved_val})

    except Exception as e:
        conn.rollback()
        return jsonify({"error": str(e)}), 500

@api_bp.route("/api/request_reapproval", methods=["POST"])
@with_db_connection
def api_request_reapproval(cursor, conn):

    if "username" not in session:
        return jsonify({"error": "Not logged in"}), 401

    data = request.get_json(force=True)
    upload_id = data.get("upload_id")
    table = data.get("table")

    if not upload_id or not table:
        return jsonify({"error": "Missing upload_id/table"}), 400

    try:
        # verify upload
        cursor.execute("""
            SELECT id, uploaded_by, status_
            FROM excel_uploads
            WHERE id=%s
        """, (upload_id,))
        up = cursor.fetchone()

        if not up:
            return jsonify({"error": "Upload not found"}), 404

        if session.get("role") == "user" and up["uploaded_by"] != session["username"]:
            return jsonify({"error": "Not your upload"}), 403

        if up["status_"] != 0:
            return jsonify({"error": "Only rejected uploads can request reapproval"}), 400

        # ✅ reset rejected rows → pending
        cursor.execute(f"""
            UPDATE `{table}`
            SET is_approved=NULL,
                updated_by=%s,
                updated_date=NOW()
            WHERE upload_id=%s AND is_approved=0
        """, (session["username"], upload_id))

        # ✅ reset upload → pending
        cursor.execute("""
            UPDATE excel_uploads
            SET status_=NULL,
                updated_by=%s,
                updated_date=NOW()
            WHERE id=%s
        """, (session["username"], upload_id))

        conn.commit()
        return jsonify({"message": "Reapproval requested"})

    except Exception as e:
        conn.rollback()
        return jsonify({"error": str(e)}), 500



@api_bp.route("/api/check_upload_review_status")
@with_db_connection
def api_check_upload_review_status(cursor, conn):
    """
    Approver validation:
    - If any row is_approved IS NULL => pending exists => block approve/reject
    - If any row is_approved = 0 => rejected exists => block approve (allow reject)
    Works for ALL transaction tables.
    """
    upload_id = request.args.get("upload_id")

    if not upload_id:
        return jsonify({"error": "Missing upload_id"}), 400

    try:
        # find transaction table
        cursor.execute("SELECT table_name FROM excel_uploads WHERE id=%s", (upload_id,))
        up = cursor.fetchone()
        if not up:
            return jsonify({"error": "Upload not found"}), 404

        table = up["table_name"]

        # ✅ check pending rows (NULL)
        cursor.execute(f"""
            SELECT COUNT(*) AS pending_count
            FROM `{table}`
            WHERE upload_id=%s AND is_approved IS NULL
        """, (upload_id,))
        pending_count = int(cursor.fetchone()["pending_count"])

        # ✅ check rejected rows
        cursor.execute(f"""
            SELECT COUNT(*) AS rejected_count
            FROM `{table}`
            WHERE upload_id=%s AND is_approved = 0
        """, (upload_id,))
        rejected_count = int(cursor.fetchone()["rejected_count"])

        return jsonify({
            "pending_count": pending_count,
            "rejected_count": rejected_count,
            "has_pending": pending_count > 0,
            "has_rejected": rejected_count > 0
        })

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500

@api_bp.route("/api/check_all_rows_reviewed")
@with_db_connection
def check_all_rows_reviewed(cursor, conn):
    upload_id = request.args.get("upload_id")
    if not upload_id:
        return jsonify({"error": "Missing upload_id"}), 400

    try:
        # get table for upload
        cursor.execute("SELECT table_name FROM excel_uploads WHERE id=%s", (upload_id,))
        up = cursor.fetchone()
        if not up:
            return jsonify({"error": "Upload not found"}), 404

        table = up["table_name"]

        # ✅ IMPORTANT: check is_approved (not status_)
        cursor.execute(f"""
            SELECT COUNT(*) AS pending_count
            FROM `{table}`
            WHERE is_approved IS NULL
        """)
        pending_count = int(cursor.fetchone()["pending_count"])

        return jsonify({
            "pending_count": pending_count,
            "has_pending": pending_count > 0
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500
