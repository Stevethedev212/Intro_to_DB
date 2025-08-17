import mysql.connector
from mysql.connector import Error

try:
    # Establish a connection to MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password"
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Create database
        cursor.execute("CREATE DATABASE IF NOT EXISTS alxbookstore")
        print("Database 'alxbookstore' created successfully!")

except Error as e:
    print(f"Error: {e}")

finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
