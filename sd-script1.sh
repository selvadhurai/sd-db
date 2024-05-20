#!/bin/bash

# Database connection parameters
DB_HOST="sd-db1.c76o4qoeq8xw.us-east-1.rds.amazonaws.com"
DB_NAME="sd-db1"
DB_USER="sd-db1"
DB_PASS="test1234"
# SQL script file
SQL_FILE="release1.sql"

# Connect to the database
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$SQL_FILE"

# Check if authentication was successful
if [ $? -eq 0 ]; then
    echo "Authentication successful. Executing SQL file..."
    # Execute SQL file
    psql -h "$DB_HOST" -d "$DB_NAME" -U "$DB_USER" -w -f "$SQL_FILE"
    if [ $? -eq 0 ]; then
        echo "SQL file executed successfully"
    else
        echo "Error executing SQL file"
    fi
else
    echo "Authentication failed. Transaction terminated."
fi
