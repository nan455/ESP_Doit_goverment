"""Authentication routes - Debug Version."""
from flask import Blueprint, render_template, request, redirect, url_for, session, jsonify, current_app
from werkzeug.security import check_password_hash, generate_password_hash
import traceback
from app.utils.database import with_db_connection, log_error_db

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

        if not username or not password:
            return jsonify({
                "success": False,
                "message": "Username and password are required"
            }), 400

        cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
        user = cursor.fetchone()

        if not user:
            return jsonify({
                "success": False,
                "message": "Invalid username or password"
            }), 401

        if not check_password_hash(user["password"], password):
            return jsonify({
                "success": False,
                "message": "Invalid username or password"
            }), 401

        # Set session data
        session.clear()
        session["username"] = user["username"]
        session["user_id"] = user["id"]
        session["department"] = user.get("department", "")
        session["role"] = user.get("role", "user")
        session["email"] = user.get("email", "")
        session.permanent = True
        
        # Print available endpoints for debugging
        print("\n=== AVAILABLE ENDPOINTS ===")
        for rule in current_app.url_map.iter_rules():
            print(f"{rule.endpoint}: {rule.rule}")
        print("=========================\n")
        
        # Determine redirect URL based on role
        role = session["role"]
        print(f"User role: {role}")
        
        try:
            if role == "admin":
                redirect_url = url_for("admin.admin_dashboard")
                print(f"Admin redirect: {redirect_url}")
            elif role == "approver":
                # Try to build the URL and catch any errors
                try:
                    redirect_url = url_for("approver.approver_dashboard")
                    print(f"Approver redirect: {redirect_url}")
                except Exception as e:
                    print(f"Error building approver URL: {e}")
                    # Fallback to direct path if url_for fails
                    redirect_url = "/approver_dashboard"
                    print(f"Using fallback redirect: {redirect_url}")
            else:
                redirect_url = url_for("data.user_dashboard")
                print(f"User redirect: {redirect_url}")
        except Exception as e:
            print(f"URL building error: {e}")
            # Fallback redirects
            if role == "admin":
                redirect_url = "/admin_dashboard"
            elif role == "approver":
                redirect_url = "/approver_dashboard"
            else:
                redirect_url = "/user_dashboard"
        
        return jsonify({
            "success": True,
            "redirect": redirect_url,
            "role": role
        }), 200
            
    except Exception as e:
        tb = traceback.format_exc()
        print(f"Login error: {e}")
        print(tb)
        config_obj = current_app.config.get("CONFIG_OBJ")
        if config_obj:
            log_error_db(username if 'username' in locals() else 'unknown', 
                        request.path, str(e), tb, config_obj)
        
        return jsonify({
            "success": False, 
            "message": f"An error occurred: {str(e)}"
        }), 500


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
        if "username" not in session:
            return jsonify({"error": "Not authenticated"}), 401
        
        data = request.get_json()
        current_password = data.get("current_password")
        new_password = data.get("new_password")
        
        if not current_password or not new_password:
            return jsonify({"error": "Both current and new password are required"}), 400
        
        if len(new_password) < 6:
            return jsonify({"error": "New password must be at least 6 characters long"}), 400
        
        username = session.get("username")
        
        cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
        user = cursor.fetchone()
        
        if not user:
            return jsonify({"error": "User not found"}), 404
        
        if not check_password_hash(user["password"], current_password):
            return jsonify({"error": "Current password is incorrect"}), 400
        
        new_password_hash = generate_password_hash(new_password)
        
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