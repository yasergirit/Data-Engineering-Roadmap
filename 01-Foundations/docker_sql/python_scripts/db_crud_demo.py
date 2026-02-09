import psycopg2
import os
from dotenv import load_dotenv

# 1. Configuration
# We use environment variables for security (see Module 1)
# For this demo, we'll hardcode or use default values if .env is missing
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "warehouse"
DB_USER = "de_user"
DB_PASS = "de_password"

def connect_db():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )
        return conn
    except Exception as e:
        print(f"Error connecting to DB: {e}")
        return None

def crud_operations():
    conn = connect_db()
    if not conn:
        return

    cur = conn.cursor()

    # --- CREATE ---
    print("\n--- [CREATE] Inserting a new product ---")
    cur.execute(
        "INSERT INTO products (name, category_id, price, stock_quantity) VALUES (%s, %s, %s, %s) RETURNING product_id;",
        ("Mechanical Keyboard", 1, 150.00, 15)
    )
    new_id = cur.fetchone()[0]
    print(f"Inserted product with ID: {new_id}")

    # --- READ ---
    print("\n--- [READ] Listing all products ---")
    cur.execute("SELECT product_id, name, price FROM products;")
    rows = cur.fetchall()
    for row in rows:
        print(f"ID: {row[0]}, Name: {row[1]}, Price: {row[2]}")

    # --- UPDATE ---
    print(f"\n--- [UPDATE] Updating price for product ID: {new_id} ---")
    cur.execute("UPDATE products SET price = %s WHERE product_id = %s;", (135.00, new_id))
    print("Price updated to 135.00")

    # --- DELETE ---
    print(f"\n--- [DELETE] Removing product ID: {new_id} ---")
    cur.execute("DELETE FROM products WHERE product_id = %s;", (new_id,))
    print(f"Product {new_id} deleted.")

    # Commit changes and close
    conn.commit()
    cur.close()
    conn.close()
    print("\nTransaction committed and connection closed.")

if __name__ == "__main__":
    crud_operations()
