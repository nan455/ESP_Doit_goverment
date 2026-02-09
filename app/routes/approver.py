"""Approver routes - FULL FINAL VERSION (strict checkbox validation)."""
from flask import Blueprint, render_template, request, jsonify, session, redirect, url_for
import traceback
import datetime
from app.utils.database import with_db_connection, log_error_db
from flask import current_app

approver_bp = Blueprint("approver", __name__)


def requires_approver(f):
    """Decorator to check if user is an approver/admin."""
    from functools import wraps
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "username" not in session:
            return redirect(url_for("auth.login_page"))

        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized - Approver access required"}), 403

        return f(*args, **kwargs)
    return decorated_function


@approver_bp.route("/approver_dashboard")
@requires_approver
def approver_dashboard():
    """Render approver dashboard page."""
    return render_template("approver_dashboard.html")


# ✅ DEBUG ROUTE (optional)
@approver_bp.route("/api/debug_session")
def debug_session():
    """Debug route to check session status."""
    return jsonify({
        "session_data": dict(session),
        "has_username": "username" in session,
        "username": session.get("username"),
        "role": session.get("role"),
        "department": session.get("department"),
        "user_id": session.get("user_id"),
        "session_keys": list(session.keys())
    })


@approver_bp.route("/api/pending_uploads")
@with_db_connection
def get_pending_uploads(cursor, conn):
    """Get uploads for approver — department filtered."""
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401

        role = session.get("role")
        department = session.get("department")

        if role not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized"}), 403

        #  ADMIN → see all departments
        if role == "admin":
            cursor.execute("""
                SELECT 
                    id,
                    filename,
                    table_name,
                    uploaded_by,
                    department,
                    uploaded_on,
                    CAST(status_ AS SIGNED) as status_
                FROM excel_uploads
                ORDER BY uploaded_on DESC
            """)
        else:
            #  APPROVER → only their department
            cursor.execute("""
                SELECT 
                    id,
                    filename,
                    table_name,
                    uploaded_by,
                    department,
                    uploaded_on,
                    CAST(status_ AS SIGNED) as status_
                FROM excel_uploads
                WHERE department = %s
                ORDER BY uploaded_on DESC
            """, (department,))

        uploads = cursor.fetchall()

        for upload in uploads:
            status = upload.get("status_")

            # Normalize
            if status is None or status == "" or status == "NULL":
                normalized = None
            elif status in [1, True, "1"]:
                normalized = 1
            elif status in [0, False, "0"]:
                normalized = 0
            else:
                normalized = None

            upload["status_"] = normalized

            if normalized is None:
                upload["status_text"] = "Pending"
                upload["status_class"] = "pending"
                upload["can_edit"] = True
                upload["can_approve"] = True
                upload["can_reject"] = True
                upload["can_delete"] = True
            elif normalized == 1:
                upload["status_text"] = "Approved"
                upload["status_class"] = "approved"
                upload["can_edit"] = False
                upload["can_approve"] = False
                upload["can_reject"] = False
                upload["can_delete"] = False
            elif normalized == 0:
                upload["status_text"] = "Rejected"
                upload["status_class"] = "rejected"
                upload["can_edit"] = False
                upload["can_approve"] = False
                upload["can_reject"] = False
                upload["can_delete"] = False

        return jsonify(uploads)

    except Exception as e:
        tb = traceback.format_exc()
        print("❌ Error:", e)
        print(tb)

        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)

        return jsonify({"error": str(e)}), 500



# ✅ 2) CHECK: any rejected rows exist
@approver_bp.route("/api/check_rejected_rows")
@with_db_connection
def check_rejected_rows(cursor, conn):
    """
    If ANY row has is_approved=0 -> upload cannot be approved.
    """
    upload_id = request.args.get("upload_id")

    if not upload_id:
        return jsonify({"error": "Missing upload_id"}), 400

    try:
        cursor.execute("""
            SELECT table_name
            FROM excel_uploads
            WHERE id = %s
        """, (upload_id,))
        up = cursor.fetchone()

        if not up:
            return jsonify({"error": "Upload not found"}), 404

        table = up["table_name"]

        cursor.execute(f"""
            SELECT COUNT(*) AS rejected_count
            FROM `{table}`
            WHERE upload_id = %s AND is_approved = 0
        """, (upload_id,))
        row = cursor.fetchone()

        rejected_count = int(row["rejected_count"] or 0)

        return jsonify({
            "rejected_count": rejected_count,
            "has_rejected": rejected_count > 0
        })

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)

        return jsonify({"error": str(e)}), 500


# ✅ APPROVE UPLOAD (strict logic)
@approver_bp.route("/api/approve_upload", methods=["POST"])
@with_db_connection
def approve_upload(cursor, conn):
    """Approve an upload with full strict rules."""
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401

        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized"}), 403

        data = request.get_json(force=True)
        upload_id = data.get("upload_id")

        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400

        # upload exists?
        cursor.execute("SELECT table_name FROM excel_uploads WHERE id=%s", (upload_id,))
        up = cursor.fetchone()
        if not up:
            return jsonify({"error": "Upload not found"}), 404

        table = up["table_name"]

        # ✅ block if pending rows exist
        cursor.execute(f"""
            SELECT COUNT(*) AS pending_count
            FROM `{table}`
            WHERE upload_id=%s AND is_approved IS NULL
        """, (upload_id,))
        pending_count = int(cursor.fetchone()["pending_count"] or 0)

        if pending_count > 0:
            return jsonify({"error": f"Cannot approve upload. Pending rows: {pending_count}"}), 400

        # ✅ block if rejected rows exist
        cursor.execute(f"""
            SELECT COUNT(*) AS rejected_count
            FROM `{table}`
            WHERE upload_id=%s AND is_approved = 0
        """, (upload_id,))
        rejected_count = int(cursor.fetchone()["rejected_count"] or 0)

        if rejected_count > 0:
            return jsonify({
                "error": f"Cannot approve upload. {rejected_count} row(s) are rejected. Reject upload instead."
            }), 400

        # ✅ approve upload
        cursor.execute("""
            UPDATE excel_uploads
            SET status_=1,
                uploaded_by=%s,
                uploaded_on=%s
            WHERE id=%s
        """, (session.get("username"), datetime.datetime.now(), upload_id))

        conn.commit()
        return jsonify({"message": "Upload approved successfully", "upload_id": upload_id})

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)

        conn.rollback()
        return jsonify({"error": str(e)}), 500


# ✅ REJECT UPLOAD (strict logic)
@approver_bp.route("/api/reject_upload", methods=["POST"])
@with_db_connection
def reject_upload(cursor, conn):
    """Reject an upload with full strict rules."""
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401

        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized"}), 403

        data = request.get_json(force=True)
        upload_id = data.get("upload_id")

        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400

        # upload exists?
        cursor.execute("SELECT table_name FROM excel_uploads WHERE id=%s", (upload_id,))
        up = cursor.fetchone()
        if not up:
            return jsonify({"error": "Upload not found"}), 404

        table = up["table_name"]

        # ✅ block reject if pending rows exist
        cursor.execute(f"""
            SELECT COUNT(*) AS pending_count
            FROM `{table}`
            WHERE upload_id=%s AND is_approved IS NULL
        """, (upload_id,))
        pending_count = int(cursor.fetchone()["pending_count"] or 0)

        if pending_count > 0:
            return jsonify({"error": f"Cannot reject upload. Pending rows: {pending_count}"}), 400

        # ✅ reject upload
        cursor.execute("""
            UPDATE excel_uploads
            SET status_=0,
                uploaded_by=%s,
                uploaded_on=%s
            WHERE id=%s
        """, (session.get("username"), datetime.datetime.now(), upload_id))

        conn.commit()
        return jsonify({"message": "Upload rejected successfully", "upload_id": upload_id})

    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)

        conn.rollback()
        return jsonify({"error": str(e)}), 500
    
    
@approver_bp.route("/api/check_all_rows_reviewed")
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
