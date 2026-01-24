"""Approver routes - COMPLETE FIXED VERSION."""
from flask import Blueprint, render_template, request, jsonify, session, redirect, url_for
import traceback
from app.utils.database import with_db_connection, log_error_db
from flask import current_app
import datetime

approver_bp = Blueprint("approver", __name__)


def requires_approver(f):
    """Decorator to check if user is an approver."""
    from functools import wraps
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # ✅ CRITICAL FIX: Check session first
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


# ✅ DEBUG ROUTE - Remove in production
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
    """Get all uploads pending approval."""
    try:
        # ✅ CRITICAL FIX: Check authentication inline instead of decorator
        if "username" not in session:
            print("❌ No username in session")
            print(f"Session keys: {list(session.keys())}")
            return jsonify({"error": "Not authenticated"}), 401
        
        if session.get("role") not in ["approver", "admin"]:
            print(f"❌ Invalid role: {session.get('role')}")
            return jsonify({"error": "Unauthorized - Approver or Admin access required"}), 403
        
        print(f"✅ User authenticated: {session.get('username')} with role: {session.get('role')}")
        
        cursor.execute("""
            SELECT 
                id,
                filename,
                table_name,
                uploaded_by,
                department,
                uploaded_on,
                status_
            FROM excel_uploads
            ORDER BY uploaded_on DESC
        """)
        uploads = cursor.fetchall()
        
        # Convert status_ to readable text
        for upload in uploads:
            if upload['status_'] == 0:
                upload['status_text'] = 'Pending'
            elif upload['status_'] == 1:
                upload['status_text'] = 'Approved'
            elif upload['status_'] == 2:
                upload['status_text'] = 'Rejected'
            else:
                upload['status_text'] = 'Unknown'
        
        print(f"✅ Returning {len(uploads)} uploads")
        return jsonify(uploads)
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error loading uploads: {e}")
        print(tb)
        
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        
        return jsonify({"error": str(e)}), 500


@approver_bp.route("/api/approve_upload", methods=["POST"])
@with_db_connection
def approve_upload(cursor, conn):
    """Approve an upload."""
    try:
        # ✅ CRITICAL FIX: Check authentication inline
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized - Approver or Admin access required"}), 403
        
        data = request.get_json()
        upload_id = data.get("upload_id")
        
        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400
        
        # ✅ Check if upload exists
        cursor.execute("SELECT id FROM excel_uploads WHERE id = %s", (upload_id,))
        if not cursor.fetchone():
            return jsonify({"error": "Upload not found"}), 404
        
        # Update status to approved (1)
        cursor.execute("""
            UPDATE excel_uploads 
            SET status_ = 1,
                updated_by = %s,
                updated_date = %s
            WHERE id = %s
        """, (session.get("username"), datetime.datetime.now(), upload_id))
        
        conn.commit()
        
        print(f"✅ Upload {upload_id} approved by {session.get('username')}")
        
        return jsonify({
            "message": "Upload approved successfully",
            "upload_id": upload_id
        })
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error approving upload: {e}")
        print(tb)
        
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        
        conn.rollback()
        return jsonify({"error": str(e)}), 500


@approver_bp.route("/api/reject_upload", methods=["POST"])
@with_db_connection
def reject_upload(cursor, conn):
    """Reject an upload."""
    try:
        # ✅ CRITICAL FIX: Check authentication inline
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized - Approver or Admin access required"}), 403
        
        data = request.get_json()
        upload_id = data.get("upload_id")
        reason = data.get("reason", "")
        
        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400
        
        # ✅ Check if upload exists
        cursor.execute("SELECT id FROM excel_uploads WHERE id = %s", (upload_id,))
        if not cursor.fetchone():
            return jsonify({"error": "Upload not found"}), 404
        
        # Update status to rejected (2)
        cursor.execute("""
            UPDATE excel_uploads 
            SET status_ = 2,
                updated_by = %s,
                updated_date = %s
            WHERE id = %s
        """, (session.get("username"), datetime.datetime.now(), upload_id))
        
        conn.commit()
        
        print(f"✅ Upload {upload_id} rejected by {session.get('username')}")
        
        return jsonify({
            "message": "Upload rejected successfully",
            "upload_id": upload_id
        })
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error rejecting upload: {e}")
        print(tb)
        
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        
        conn.rollback()
        return jsonify({"error": str(e)}), 500