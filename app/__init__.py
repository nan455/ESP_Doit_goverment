"""Flask application factory."""
from flask import Flask
from flask_cors import CORS
import os
from app.config import config
from app.routes import auth, admin, api, data
from app.utils.database import get_db_connection


def create_app(config_name=None):
    """Create and configure the Flask application."""
    if config_name is None:
        config_name = os.environ.get("FLASK_ENV", "default")
    
    app = Flask(__name__, 
                template_folder="templates",
                static_folder="static")
    
    # Load configuration
    config_class = config.get(config_name, config["default"])
    app.config.from_object(config_class)
    app.config["CONFIG_OBJ"] = config_class()
    
    # Initialize CORS
    if config_class.CORS_ENABLED:
        CORS(app)
    
    # Create necessary directories
    os.makedirs(app.config["UPLOAD_FOLDER"], exist_ok=True)
    os.makedirs(app.config["TEMPLATE_FOLDER"], exist_ok=True)
    
    # Register blueprints
    app.register_blueprint(auth.auth_bp)
    app.register_blueprint(admin.admin_bp)
    app.register_blueprint(api.api_bp)
    app.register_blueprint(data.data_bp)
    
    # Set up custom JSON encoder
    from app.routes.api import CustomJSONEncoder
    app.json_encoder = CustomJSONEncoder
    app.json_provider_class = type(
        "CustomJSONProvider",
        (app.json_provider_class,),
        {"default": staticmethod(CustomJSONEncoder().default)},
    )
    
    # Ensure error_logs table exists on startup
    with app.app_context():
        try:
            conn_init = get_db_connection(app.config["CONFIG_OBJ"])
            cur_init = conn_init.cursor()
            cur_init.execute("""
                CREATE TABLE IF NOT EXISTS error_logs (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(150),
                    endpoint VARCHAR(255),
                    error_message TEXT,
                    traceback LONGTEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
            """)
            conn_init.commit()
            cur_init.close()
            conn_init.close()
        except Exception as e:
            print("⚠️ Could not create error_logs table:", e)
    
    return app

