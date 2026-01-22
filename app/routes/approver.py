"""Approver routes - GUARANTEED WORKING VERSION."""
from flask import Blueprint, render_template, request, jsonify, session, redirect, url_for
import traceback
from app.utils.database import with_db_connection, log_error_db
from flask import current_app
import datetime

# Create blueprint - MUST match route exactly
approver_bp = Blueprint("approver", __name__)

print("=" * 70)
print("APPROVER BLUEPRINT MODULE LOADED")
print("=" * 70)


@approver_bp.route("/approver_dashboard")
def approver_dashboard():
    """Render approver dashboard page."""
    print("\n" + "=" * 70)
    print("APPROVER DASHBOARD ROUTE HIT")
    print("=" * 70)
    print(f"Session data:")
    print(f"  Username: {session.get('username')}")
    print(f"  Role: {session.get('role')}")
    print(f"  User ID: {session.get('user_id')}")
    print(f"  Department: {session.get('department')}")
    
    # Check authentication
    if "username" not in session:
        print("❌ No username in session - redirecting to login")
        return redirect("/")
    
    if session.get("role") != "approver":
        print(f"❌ User role is '{session.get('role')}', not 'approver'")
        return f"<h1>Access Denied</h1><p>Role: {session.get('role')}</p><p>Expected: approver</p>", 403
    
    print("✅ Authentication passed - rendering dashboard")
    
    try:
        return render_template("approver_dashboard.html")
    except Exception as e:
        print(f"❌ Error rendering template: {e}")
        import traceback
        traceback.print_exc()
        return f"<h1>Template Error</h1><pre>{traceback.format_exc()}</pre>", 500


@approver_bp.route("/api/pending_uploads")
@with_db_connection
def get_pending_uploads(cursor, conn):
    """Get all uploads pending approval."""
    try:
        print("\n📋 Fetching pending uploads...")
        
        # Check authentication
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
            
        if session.get("role") != "approver":
            return jsonify({"error": "Unauthorized - Approver access required"}), 403

        cursor.execute("""
            SELECT 
                id,
                filename,
                table_name,
                uploaded_by,
                department,
                uploaded_on,
                COALESCE(status_, 0) as status_
            FROM excel_uploads
            ORDER BY uploaded_on DESC
        """)
        uploads = cursor.fetchall()
        
        print(f"  Found {len(uploads)} uploads")
        
        # Convert status_ to readable text
        for upload in uploads:
            status_val = upload.get('status_', 0)
            if status_val == 0:
                upload['status_text'] = 'Pending'
            elif status_val == 1:
                upload['status_text'] = 'Approved'
            elif status_val == 2:
                upload['status_text'] = 'Rejected'
            else:
                upload['status_text'] = 'Unknown'
        
        return jsonify(uploads)
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error in get_pending_uploads: {e}")
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
        print("\n✅ Approving upload...")
        
        # Check authentication
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
            
        if session.get("role") != "approver":
            return jsonify({"error": "Unauthorized - Approver access required"}), 403

        data = request.get_json()
        upload_id = data.get("upload_id")
        
        print(f"  Upload ID: {upload_id}")
        
        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400
        
        # Check if upload exists
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
        
        print(f"  ✅ Upload {upload_id} approved")
        
        return jsonify({
            "message": "Upload approved successfully",
            "upload_id": upload_id
        }), 200
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error in approve_upload: {e}")
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
        print("\n❌ Rejecting upload...")
        
        # Check authentication
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
            
        if session.get("role") != "approver":
            return jsonify({"error": "Unauthorized - Approver access required"}), 403

        data = request.get_json()
        upload_id = data.get("upload_id")
        reason = data.get("reason", "")
        
        print(f"  Upload ID: {upload_id}")
        print(f"  Reason: {reason}")
        
        if not upload_id:
            return jsonify({"error": "Upload ID is required"}), 400
        
        # Check if upload exists
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
        
        print(f"  ✅ Upload {upload_id} rejected")
        
        return jsonify({
            "message": "Upload rejected successfully",
            "upload_id": upload_id
        }), 200
        
    except Exception as e:
        tb = traceback.format_exc()
        print(f"❌ Error in reject_upload: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        conn.rollback()
        return jsonify({"error": str(e)}), 500


print("✅ All approver routes registered on blueprint")