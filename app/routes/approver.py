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
    """Get all uploads for approver - FIXED STATUS with CAST."""
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized"}), 403
        
        print(f"\n🔍 Approver loading uploads...")
        
        # ✅ Use CAST to ensure consistent integer type
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
        uploads = cursor.fetchall()
        
        # ✅ CONSISTENT STATUS HANDLING
        for upload in uploads:
            status = upload.get('status_')
            upload_id = upload.get('id')
            
            print(f"   Upload #{upload_id}: status_ = {status} (type: {type(status)})")
            
            # Normalize status value
            if status is None or status == '' or status == 'NULL':
                normalized_status = None  # Pending
            elif status in [1, True, '1']:
                normalized_status = 1  # Approved
            elif status in [0, False, '0']:
                normalized_status = 0  # Rejected
            else:
                normalized_status = None
            
            # Add status text and class
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
            
            # ✅ NEW STRICT PERMISSION LOGIC FOR APPROVER
            # RULE: Only PENDING uploads can be edited/approved/rejected
            # RULE: Approved uploads are LOCKED (view-only)
            # RULE: Rejected uploads are LOCKED (view-only, cannot re-edit)
            
            can_edit = False
            can_approve = False
            can_reject = False
            can_delete = False
            
            if normalized_status is None:
                # ✅ PENDING - Approver can do everything
                can_edit = True
                can_approve = True
                can_reject = True
                can_delete = True
                
            elif normalized_status == 1:
                # ❌ APPROVED - LOCKED (view-only)
                can_edit = False
                can_approve = False
                can_reject = False
                can_delete = False
                
                # 💾 BACKUP: Uncomment to allow approver to edit approved uploads
                # can_edit = True
                # can_reject = True  # Allow re-rejection of approved
                
            elif normalized_status == 0:
                # ❌ REJECTED - LOCKED (view-only, cannot make changes)
                can_edit = False
                can_approve = False  # Cannot re-approve rejected
                can_reject = False
                can_delete = False
                
                # 💾 BACKUP: Uncomment to allow approver to edit rejected uploads
                # can_edit = True
                # can_approve = True  # Allow re-approval of rejected
            
            upload['can_edit'] = can_edit
            upload['can_approve'] = can_approve
            upload['can_reject'] = can_reject
            upload['can_delete'] = can_delete
            
            print(f"      → Status: {upload['status_text']}, Can Edit: {can_edit}, Can Approve: {can_approve}, Can Reject: {can_reject}")

        
        return jsonify(uploads)
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error: {e}")
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
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        if session.get("role") not in ["approver", "admin"]:
            return jsonify({"error": "Unauthorized"}), 403
        
        data = request.get_json()
        upload_id = data.get("upload_id")
        
        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400
        
        cursor.execute("SELECT id FROM excel_uploads WHERE id = %s", (upload_id,))
        if not cursor.fetchone():
            return jsonify({"error": "Upload not found"}), 404
        
        # ✅ Set status_ = 1 for approved
        cursor.execute("""
            UPDATE excel_uploads 
            SET status_ = 1,
                uploaded_by = %s,
                uploaded_on = %s
            WHERE id = %s
        """, (session.get("username"), datetime.datetime.now(), upload_id))
        
        conn.commit()
        
        return jsonify({
            "message": "Upload approved successfully",
            "upload_id": upload_id
        })
        
    except Exception as e:
        tb = traceback.format_exc()
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
            SET status_ = 0,
                uploaded_by = %s,
                uploaded_on = %s
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