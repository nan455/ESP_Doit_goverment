"""Additional API routes for ROW-LEVEL approval system."""
from flask import Blueprint, request, jsonify, session
import datetime
import traceback
from app.utils.database import with_db_connection, log_error_db
from app.utils.validators import (
    is_audit_column,
    is_refno_column,
    resolve_year,
    fk_value_to_id,
)
from app.constants import LOOKUP_CONFIG
from flask import current_app

# This blueprint can be merged into api.py or used separately
row_api_bp = Blueprint("row_api", __name__)


@row_api_bp.route("/api/rejected_rows/<int:upload_id>", methods=["GET"])
@with_db_connection
def get_rejected_rows_api(cursor, conn, upload_id):
    """
    Get all rejected rows for a specific upload.
    Users can only see their own rejected rows.
    """
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        # Get upload info
        cursor.execute("""
            SELECT table_name, uploaded_by, department 
            FROM excel_uploads 
            WHERE id = %s
        """, (upload_id,))
        
        upload = cursor.fetchone()
        if not upload:
            return jsonify({"error": "Upload not found"}), 404
        
        # Permission check
        role = session.get("role")
        username = session.get("username")
        
        if role == "user":
            if upload["uploaded_by"] != username:
                return jsonify({"error": "Permission denied"}), 403
        elif role not in ["admin", "approver"]:
            return jsonify({"error": "Permission denied"}), 403
        
        table_name = upload["table_name"]
        
        # Check if table has upload_id column
        cursor.execute(f"SHOW COLUMNS FROM `{table_name}` LIKE 'upload_id'")
        if not cursor.fetchone():
            return jsonify({"error": "Table does not support row-level tracking"}), 400
        
        # Get rejected rows (status_ = 0)
        cursor.execute(f"""
            SELECT * FROM `{table_name}` 
            WHERE upload_id = %s AND is_approved = 0
            ORDER BY id
        """, (upload_id,))
        
        rows = cursor.fetchall()
        
        # Get column info
        cursor.execute(f"SHOW COLUMNS FROM `{table_name}`")
        columns_info = cursor.fetchall()
        
        # Build column metadata
        columns = []
        for col in columns_info:
            col_name = col["Field"]
            is_editable = not (
                col_name in ["id", "upload_id"] or 
                is_audit_column(col_name) or 
                is_refno_column(col_name)
            )
            
            columns.append({
                "name": col_name,
                "type": col["Type"],
                "editable": is_editable,
                "is_fk": col_name.endswith("_id"),
            })
        
        return jsonify({
            "upload_id": upload_id,
            "table_name": table_name,
            "columns": columns,
            "rejected_rows": rows,
            "count": len(rows)
        })
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error getting rejected rows: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500


@row_api_bp.route("/api/update_rejected_row", methods=["POST"])
@with_db_connection
def update_rejected_row(cursor, conn):
    """
    Update a single rejected row.
    Only users can edit their own rejected rows.
    """
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        data = request.get_json()
        table_name = data.get("table")
        row_id = data.get("row_id")
        updates = data.get("updates")  # Dict of column: value
        upload_id = data.get("upload_id")
        
        if not all([table_name, row_id, updates, upload_id]):
            return jsonify({"error": "Missing required fields"}), 400
        
        # Get upload info for permission check
        cursor.execute("""
            SELECT uploaded_by FROM excel_uploads WHERE id = %s
        """, (upload_id,))
        
        upload = cursor.fetchone()
        if not upload:
            return jsonify({"error": "Upload not found"}), 404
        
        # Permission check - only owner can edit their rejected rows
        role = session.get("role")
        username = session.get("username")
        
        if role == "user":
            if upload["uploaded_by"] != username:
                return jsonify({"error": "Permission denied"}), 403
        elif role not in ["admin", "approver"]:
            return jsonify({"error": "Permission denied"}), 403
        
        # Verify row is rejected and belongs to this upload
        cursor.execute(f"""
            SELECT status_ FROM `{table_name}` 
            WHERE id = %s AND upload_id = %s
        """, (row_id, upload_id))
        
        row = cursor.fetchone()
        if not row:
            return jsonify({"error": "Row not found"}), 404
        
        if row["status_"] != 0:
            return jsonify({"error": "Can only edit rejected rows"}), 400
        
        # Get column info
        cursor.execute(f"SHOW COLUMNS FROM `{table_name}`")
        cols_info = cursor.fetchall()
        col_names = [c["Field"] for c in cols_info]
        
        # Build UPDATE statement
        set_clauses = []
        values = []
        
        for key, val in updates.items():
            # Skip non-editable columns
            if key not in col_names:
                continue
            if key in ["id", "upload_id"] or is_audit_column(key) or is_refno_column(key):
                continue
            
            # Process value
            if isinstance(val, str):
                val = val.strip() or None
            
            # Handle foreign keys
            if key == "year_id":
                val = resolve_year(cursor, val)
            elif key.endswith("_id"):
                val = fk_value_to_id(cursor, key, val, LOOKUP_CONFIG)
            
            set_clauses.append(f"`{key}` = %s")
            values.append(val)
        
        if not set_clauses:
            return jsonify({"error": "Nothing to update"}), 400
        
        # Add audit fields
        set_clauses.append("`updated_by` = %s")
        values.append(username)
        set_clauses.append("`updated_date` = %s")
        values.append(datetime.datetime.now())
        
        # Execute update
        values.append(row_id)
        sql = f"UPDATE `{table_name}` SET {', '.join(set_clauses)} WHERE id = %s"
        cursor.execute(sql, tuple(values))
        conn.commit()
        
        print(f"✅ Updated rejected row {row_id} in {table_name}")
        
        return jsonify({
            "message": "Row updated successfully",
            "row_id": row_id
        })
        
    except Exception as e:
        conn.rollback()
        tb = traceback.format_exc()
        print(f"❌ Error updating rejected row: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500


@row_api_bp.route("/api/upload/<int:upload_id>/row_stats", methods=["GET"])
@with_db_connection
def get_upload_row_stats(cursor, conn, upload_id):
    """
    Get row-level statistics for an upload.
    Returns counts of approved, rejected, and pending rows.
    """
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        # Get upload info
        cursor.execute("""
            SELECT table_name, uploaded_by, department 
            FROM excel_uploads 
            WHERE id = %s
        """, (upload_id,))
        
        upload = cursor.fetchone()
        if not upload:
            return jsonify({"error": "Upload not found"}), 404
        
        table_name = upload["table_name"]
        
        # Check if table has upload_id column
        cursor.execute(f"SHOW COLUMNS FROM `{table_name}` LIKE 'upload_id'")
        if not cursor.fetchone():
            return jsonify({"error": "Table does not support row-level tracking"}), 400
        
        # Get row counts by status
        cursor.execute(f"""
            SELECT 
                COUNT(*) as total_rows,
                SUM(CASE WHEN status_ = 1 THEN 1 ELSE 0 END) as approved_rows,
                SUM(CASE WHEN status_ = 0 THEN 1 ELSE 0 END) as rejected_rows,
                SUM(CASE WHEN status_ IS NULL THEN 1 ELSE 0 END) as pending_rows
            FROM `{table_name}`
            WHERE upload_id = %s
        """, (upload_id,))
        
        stats = cursor.fetchone()
        
        return jsonify({
            "upload_id": upload_id,
            "table_name": table_name,
            "total_rows": stats["total_rows"] or 0,
            "approved_rows": stats["approved_rows"] or 0,
            "rejected_rows": stats["rejected_rows"] or 0,
            "pending_rows": stats["pending_rows"] or 0,
        })
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error getting row stats: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500


@row_api_bp.route("/api/pending_rows/<int:upload_id>", methods=["GET"])
@with_db_connection
def get_pending_rows(cursor, conn, upload_id):
    """
    Get all pending rows for an upload (for approver review).
    """
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        role = session.get("role")
        if role not in ["approver", "admin"]:
            return jsonify({"error": "Approver access required"}), 403
        
        # Get upload info
        cursor.execute("""
            SELECT table_name FROM excel_uploads WHERE id = %s
        """, (upload_id,))
        
        upload = cursor.fetchone()
        if not upload:
            return jsonify({"error": "Upload not found"}), 404
        
        table_name = upload["table_name"]
        
        # Get pending rows (status_ = NULL)
        cursor.execute(f"""
            SELECT * FROM `{table_name}` 
            WHERE upload_id = %s AND status_ IS NULL
            ORDER BY id
        """, (upload_id,))
        
        rows = cursor.fetchall()
        
        # Get column metadata
        cursor.execute(f"SHOW COLUMNS FROM `{table_name}`")
        columns = [col["Field"] for col in cursor.fetchall()]
        
        return jsonify({
            "upload_id": upload_id,
            "table_name": table_name,
            "columns": columns,
            "pending_rows": rows,
            "count": len(rows)
        })
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error getting pending rows: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        return jsonify({"error": str(e)}), 500