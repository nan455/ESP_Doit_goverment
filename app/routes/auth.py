"""Authentication routes."""
from flask import Blueprint, render_template, request, redirect, url_for, session, jsonify
from werkzeug.security import check_password_hash, generate_password_hash
import traceback
from app.utils.database import with_db_connection, log_error_db
from flask import current_app

auth_bp = Blueprint("auth", __name__)


@auth_bp.route("/")
def login_page():
    """Render login page."""
    return render_template("login.html")


@auth_bp.route("/login", methods=["POST"])
@with_db_connection
def login(cursor, conn):
    """Handle user login."""
    try:
        username = request.form.get("username")
        password = request.form.get("password")

        cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
        user = cursor.fetchone()

        if user and check_password_hash(user["password"], password):
            session["username"] = user["username"]
            session["user_id"] = user["id"]
            session["department"] = user.get("department", "")
            session["role"] = user.get("role", "user")
            session["email"] = user.get("email", "")
            
            if session["role"] == "admin":
                return redirect(url_for("admin.admin_dashboard"))
            return redirect(url_for("data.user_dashboard"))
        
        # IMPORTANT: Return JSON with proper status code
        response = jsonify({"success": False, "message": "Invalid username or password."})
        response.status_code = 401
        return response
        
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        response = jsonify({"success": False, "message": "An error occurred. Please try again."})
        response.status_code = 500
        return response


@auth_bp.route("/logout", methods=["GET", "POST"])
def logout():
    """Handle user logout."""
    session.clear()
    return redirect(url_for("auth.login_page"))


@auth_bp.route("/api/current_user", methods=["GET"])
def get_current_user():
    """Get current logged-in user information."""
    try:
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        return jsonify({
            "username": session.get("username"),
            "role": session.get("role", "user"),
            "department": session.get("department", ""),
            "email": session.get("email", ""),
            "user_id": session.get("user_id")
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@auth_bp.route("/api/change_password", methods=["POST"])
@with_db_connection
def change_password(cursor, conn):
    """Handle password change for logged-in user."""
    try:
        # Check if user is logged in
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        data = request.get_json()
        current_password = data.get("current_password")
        new_password = data.get("new_password")
        
        # Validate input
        if not current_password or not new_password:
            return jsonify({"error": "Both current and new password are required"}), 400
        
        if len(new_password) < 6:
            return jsonify({"error": "New password must be at least 6 characters long"}), 400
        
        username = session.get("username")
        
        # Get current user from database
        cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
        user = cursor.fetchone()
        
        if not user:
            return jsonify({"error": "User not found"}), 404
        
        # Verify current password
        if not check_password_hash(user["password"], current_password):
            return jsonify({"error": "Current password is incorrect"}), 400
        
        # Hash new password
        new_password_hash = generate_password_hash(new_password)
        
        # Update password in database
        cursor.execute(
            "UPDATE users SET password=%s WHERE username=%s",
            (new_password_hash, username)
        )
        conn.commit()
        
        return jsonify({
            "message": "Password changed successfully! Please login again with your new password."
        }), 200
        
    except Exception as e:
        tb = traceback.format_exc()
        config_obj = current_app.config.get("CONFIG_OBJ")
        log_error_db(session.get("username"), request.path, str(e), tb, config_obj)
        
        return jsonify({"error": "Failed to change password. Please try again."}), 500