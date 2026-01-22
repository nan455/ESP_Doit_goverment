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
    """Process uploaded transaction Excel file."""
    if "username" not in session:
        return {"error": "Unauthorized"}, 401

    # Load DB columns
    try:
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        db_cols = [c["Field"] for c in cols_info]
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return {"error": f"Target table error: {e}"}, 400

    # Read Excel file
    try:
        df = pd.read_excel(file_obj)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return {"error": f"Unable to read Excel: {e}"}, 400

    if df.empty:
        return {"error": "File is empty"}, 400

    df.fillna("", inplace=True)

    # Load column metadata (REAL MAPPING)
    header_to_col = load_metadata_for_table(cursor, table)

    # Fallback mappings (safe)
    for c in db_cols:
        header_to_col[c.lower()] = c
        header_to_col[c.replace("_", " ").lower()] = c

    inserted_rows = []
    errors = []

    for idx, row in df.iterrows():
        excel_row_num = idx + 2
        row_data = {}

        try:
            for header in df.columns:
                raw_val = row[header]

                # Skip empty values
                if str(raw_val).strip() == "":
                    continue

                # Normalize header
                key = header.strip().lower()

                # Find correct DB column
                col = header_to_col.get(key)
                if not col:
                    col = header_to_col.get(header.strip().replace(" ", "_").lower())

                if not col or col not in db_cols:
                    continue

                # Skip audit/refno columns
                if col == "id" or is_audit_column(col) or is_refno_column(col):
                    continue

                value = raw_val

                # FK and year special handlers
                if col == "year_id":
                    value = resolve_year(cursor, value)
                elif col.endswith("_id"):
                    value = fk_value_to_id(cursor, col, value, LOOKUP_CONFIG)
                else:
                    if isinstance(value, str):
                        value = value.strip() or None

                row_data[col] = value

            # Skip empty row
            if not row_data:
                continue

            # Add audit columns
            if "created_by" in db_cols:
                row_data.setdefault("created_by", session.get("username"))
            if "created_date" in db_cols:
                row_data.setdefault("created_date", datetime.datetime.now())
            if "status_" in db_cols:
                row_data.setdefault("status_", 1)
            if "updated_by" in db_cols:
                row_data.setdefault("updated_by", session.get("username"))
            if "updated_date" in db_cols:
                row_data.setdefault("updated_date", datetime.datetime.now())

            inserted_rows.append((excel_row_num, row_data))

        except Exception as e:
            tb = traceback.format_exc()
            errors.append(f"Row {excel_row_num}: {e}")
            # log detailed error for admin
            config_obj = current_app.config.get("CONFIG_OBJ")
            log_error_db(session.get("username"), request.path, f"Row {excel_row_num}: {e}", tb, config_obj)

    # Error handling
    if errors:
        return {"error": "; ".join(errors)}, 400

    if not inserted_rows:
        return {"error": "No valid rows to insert"}, 400

    # Bulk insert into DB
    try:
        all_cols = sorted({c for _, rd in inserted_rows for c in rd.keys()})
        col_list = ", ".join(f"`{c}`" for c in all_cols)
        placeholders = ", ".join(["%s"] * len(all_cols))

        sql = f"INSERT INTO `{table}` ({col_list}) VALUES ({placeholders})"
        values = [tuple(rd.get(c) for c in all_cols) for _, rd in inserted_rows]

        cursor.executemany(sql, values)

        # Log upload
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

        conn.commit()
        return {"message": f"Inserted {len(values)} rows into {table}"}, 200

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        print(traceback.format_exc())
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
    """Download table data as Excel."""
    table = request.args.get("table")
    filename = request.args.get("filename", f"{table}.xlsx")

    try:
        cursor.execute(f"SELECT * FROM `{table}`")
        rows = cursor.fetchall()
        df = pd.DataFrame(rows)

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
    """Get list of uploads."""
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
        if session.get("role") == "admin":
            cursor.execute(
                "SELECT id, filename, table_name, uploaded_by, "
                "department, uploaded_on "
                "FROM excel_uploads ORDER BY uploaded_on DESC"
            )
        else:
            dept = request.args.get("department") or session.get("department")
            cursor.execute(
                "SELECT id, filename, table_name, uploaded_by, "
                "department, uploaded_on "
                "FROM excel_uploads WHERE department=%s "
                "ORDER BY uploaded_on DESC",
                (dept,),
            )
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


@data_bp.route("/uploads/<int:uid>", methods=["DELETE"])
@with_db_connection
def uploads_delete(cursor, conn, uid):
    """Delete an upload record."""
    cursor.execute(
        "SELECT table_name, uploaded_by FROM excel_uploads WHERE id=%s",
        (uid,),
    )
    rec = cursor.fetchone()
    if not rec:
        return jsonify({"error": "Not found"}), 404

    if session.get("role") != "admin":
        if rec["uploaded_by"] != session.get("username"):
            return jsonify({"error": "Forbidden"}), 403

    cursor.execute("DELETE FROM excel_uploads WHERE id=%s", (uid,))
    conn.commit()
    return jsonify({"message": "Deleted"})

