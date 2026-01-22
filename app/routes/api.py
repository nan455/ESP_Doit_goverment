"""API routes for data operations."""
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


@api_bp.route("/api/profile")
@with_db_connection
def api_profile(cursor, conn):
    """Get current user profile."""
    cursor.execute(
        "SELECT id, username, department, role "
        "FROM users WHERE username=%s",
        (session.get("username"),),
    )
    return jsonify(cursor.fetchone())


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
    try:
        cursor.execute(f"SHOW COLUMNS FROM `{table}` LIKE 'id'")
        has_id = cursor.fetchone()
        sql = f"SELECT * FROM `{table}`"
        if has_id:
            sql += " ORDER BY id DESC"
        sql += " LIMIT 1000"
        cursor.execute(sql)
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
        if cursor.fetchone():
            return True
    except Exception:
        pass

    cursor.execute(
        "SELECT 1 FROM excel_uploads WHERE table_name=%s AND department=%s LIMIT 1",
        (table_name, dept),
    )
    return cursor.fetchone() is not None


@api_bp.route("/api/update_excel_cell", methods=["POST"])
@with_db_connection
def api_update_excel_cell(cursor, conn):
    """Update a single cell in a table."""
    data = request.get_json(force=True)
    table = data.get("table")
    col = data.get("column")
    val = data.get("value")
    row_id = data.get("id")

    # Permission check
    if not user_can_edit_table(cursor, table):
        return jsonify({"error": "You do not have permission to edit this table."}), 403

    try:
        # Clean string
        if isinstance(val, str):
            val = val.strip() or None

        # Load table columns
        cursor.execute(f"SHOW COLUMNS FROM `{table}`")
        cols_info = cursor.fetchall()
        db_cols = [c["Field"] for c in cols_info]

        if col not in db_cols:
            return jsonify({"error": "Invalid column."}), 400

        if col == "id" or is_audit_column(col):
            return jsonify({"error": "This column cannot be edited."}), 400

        # Special: year column → convert display → id
        if col == "year_id":
            try:
                val = resolve_year(cursor, val)
            except Exception as e:
                return jsonify({"error": "Invalid year selected."}), 400

        # Special: foreign key columns
        elif col.endswith("_id"):
            try:
                val = fk_value_to_id(cursor, col, val, LOOKUP_CONFIG)
            except Exception as e:
                return jsonify({"error": "Invalid option selected."}), 400

        # Detect primary key
        cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name = 'PRIMARY'")
        pk_res = cursor.fetchone()
        pk_col = pk_res["Column_name"] if pk_res else "id"

        # Build UPDATE
        audit_sql = ""
        audit_vals = []

        if "updated_by" in db_cols:
            audit_sql += ", updated_by=%s"
            audit_vals.append(session.get("username", "system"))

        if "updated_date" in db_cols:
            audit_sql += ", updated_date=%s"
            audit_vals.append(datetime.datetime.now())

        sql = f"UPDATE `{table}` SET `{col}`=%s{audit_sql} WHERE `{pk_col}`=%s"

        cursor.execute(sql, (val, *audit_vals, row_id))
        conn.commit()

        return jsonify({"message": "Saved", "value": val})

    except ValueError:
        conn.rollback()
        return jsonify({"error": "Invalid value entered."}), 400

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        print("❌ update error:", e)
        return jsonify({
            "error": "Something went wrong. Please enter valid data."
        }), 400


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
    """Get uploads for current user's department."""
    try:
        department = session.get("department")
        role = session.get("role")
        
        if role == "admin":
            # Admin sees all uploads
            cursor.execute("""
                SELECT id, filename, table_name, uploaded_by, department, 
                       uploaded_on, status_
                FROM excel_uploads 
                ORDER BY uploaded_on DESC
            """)
        else:
            # Users see only their department's uploads
            cursor.execute("""
                SELECT id, filename, table_name, uploaded_by, department, 
                       uploaded_on, status_
                FROM excel_uploads 
                WHERE department = %s 
                ORDER BY uploaded_on DESC
            """, (department,))
        
        uploads = cursor.fetchall()
        return jsonify(uploads)
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500


        return jsonify({"error": str(e)}), 500