#!/usr/bin/python3
"""
MySQLServer.py
Creates the database 'alx_book_store' in MySQL server.
If the database already exists, the script will not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # 1. Connect to MySQL server
        connection = mysql.connector.connect(
            host="localhost",      # adjust if your MySQL is remote
            user="root",           # replace with your MySQL username
            password="your_password"  # replace with your MySQL password
        )

        # 2. If connection is successful
        if connection.is_connected():
            cursor = connection.cursor()

            # 3. Create the database (safe way, won't fail if exists)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # 4. Handle connection errors
        print(f"Error: {e}")

    finally:
        # 5. Close resources properly
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
        except:
            pass

if __name__ == "__main__":
    create_database()
