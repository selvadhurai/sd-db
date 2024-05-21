#!/bin/bash
# Database connection parameters
DB_HOST="sd-db1.c76o4qoeq8xw.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="sd_firstdb"
DB_USER="postgres"
DB_PASSWORD=$DB_PASSWORD
# SQL script file
SQL_FILE="./release1.sql"
# Connect to the database
pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"
# Check if authentication was successful
if [ $? -eq 0 ]; then
    echo "Authentication successful. Executing SQL file..."
    # Execute SQL file
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$SQL_FILE"
    if [ $? -eq 0 ]; then
        echo "SQL file executed successfully"
    else
        echo "Error executing SQL file"
    fi
else
    echo "Authentication failed. Transaction terminated."
fi
