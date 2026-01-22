"""Test database connection and verify approver user exists."""
import mysql.connector
from werkzeug.security import generate_password_hash
from app.config import config

def test_connection():
    """Test database connection and setup."""
    
    # Get config
    config_obj = config['development']()
    db_config = config_obj.db_config
    
    print("=" * 60)
    print("DATABASE CONNECTION TEST")
    print("=" * 60)
    print(f"Host: {db_config['host']}")
    print(f"Database: {db_config['database']}")
    print(f"User: {db_config['user']}")
    print("-" * 60)
    
    conn = None
    cursor = None
    
    try:
        # Connect to database
        print("\n1. Connecting to database...")
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        print("✓ Connected successfully!")
        
        # Test 1: Check users table
        print("\n2. Checking users table...")
        cursor.execute("SHOW TABLES LIKE 'users'")
        if cursor.fetchone():
            print("✓ Users table exists")
        else:
            print("✗ Users table NOT found!")
            return
        
        # Test 2: List all users
        print("\n3. Listing all users:")
        cursor.execute("SELECT id, username, role, department FROM users")
        users = cursor.fetchall()
        
        if not users:
            print("✗ No users found in database!")
            print("\nCreating test approver user...")
            create_approver_user(cursor, conn)
        else:
            print(f"Found {len(users)} user(s):")
            for user in users:
                print(f"  - ID: {user['id']}, Username: {user['username']}, Role: {user['role']}, Dept: {user['department']}")
        
        # Test 3: Check for approver users
        print("\n4. Checking for approver users...")
        cursor.execute("SELECT id, username, department FROM users WHERE role = 'approver'")
        approvers = cursor.fetchall()
        
        if not approvers:
            print("✗ No approver users found!")
            print("\nWould you like to create one? (y/n)")
            # For now, auto-create
            create_approver_user(cursor, conn)
        else:
            print(f"✓ Found {len(approvers)} approver(s):")
            for approver in approvers:
                print(f"  - Username: {approver['username']}, Dept: {approver['department']}")
        
        # Test 4: Check excel_uploads table structure
        print("\n5. Checking excel_uploads table...")
        cursor.execute("SHOW COLUMNS FROM excel_uploads")
        columns = cursor.fetchall()
        
        required_cols = ['status_', 'updated_by', 'updated_date']
        existing_cols = [col['Field'] for col in columns]
        
        missing_cols = [col for col in required_cols if col not in existing_cols]
        
        if missing_cols:
            print(f"✗ Missing columns: {', '.join(missing_cols)}")
            print("\nAdding missing columns...")
            
            if 'status_' in missing_cols:
                cursor.execute("ALTER TABLE excel_uploads ADD COLUMN status_ TINYINT DEFAULT 0")
                print("  + Added status_ column")
            
            if 'updated_by' in missing_cols:
                cursor.execute("ALTER TABLE excel_uploads ADD COLUMN updated_by VARCHAR(100)")
                print("  + Added updated_by column")
            
            if 'updated_date' in missing_cols:
                cursor.execute("ALTER TABLE excel_uploads ADD COLUMN updated_date DATETIME")
                print("  + Added updated_date column")
            
            conn.commit()
            print("✓ Columns added successfully!")
        else:
            print("✓ All required columns exist")
        
        print("\n" + "=" * 60)
        print("DATABASE TEST COMPLETED SUCCESSFULLY!")
        print("=" * 60)
        
    except mysql.connector.Error as e:
        print(f"\n✗ DATABASE ERROR: {e}")
        print(f"Error Code: {e.errno}")
        print(f"SQL State: {e.sqlstate}")
        
    except Exception as e:
        print(f"\n✗ ERROR: {e}")
        import traceback
        traceback.print_exc()
        
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()
        print("\nConnection closed.")


def create_approver_user(cursor, conn):
    """Create a test approver user."""
    try:
        username = "approver_test"
        password = "Approver@123"  # Must match password requirements
        hashed_password = generate_password_hash(password)
        
        cursor.execute("""
            INSERT INTO users (username, password, department, role, created_by)
            VALUES (%s, %s, %s, %s, %s)
        """, (username, hashed_password, "Approver Department", "approver", "system"))
        
        conn.commit()
        
        print(f"\n✓ Created test approver user:")
        print(f"  Username: {username}")
        print(f"  Password: {password}")
        print(f"  Role: approver")
        
    except mysql.connector.IntegrityError:
        print(f"  User '{username}' already exists")
    except Exception as e:
        print(f"  ✗ Failed to create user: {e}")


if __name__ == "__main__":
    test_connection()