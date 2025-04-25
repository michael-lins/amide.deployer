#!/bin/bash

set -e

echo "Starting OJS restore process..."

# Paths (adjust if needed)
SQL_BACKUP="~/ojs_backup.sql"
FILES_BACKUP="~/ojs_files_backup.tar.gz"

# Step 1: Upload backup files to server first

# Step 2: Extract files
echo "Extracting files..."
tar xzvf $FILES_BACKUP

# Step 3: Copy files into Docker volume
echo "Copying files into container..."
docker cp files/ $(docker ps -qf name=app)://var/www/html/files

# Step 4: Import DB
echo "Importing database..."
docker exec -i $(docker ps -qf name=db) mysql -u root -psecret ojs < $SQL_BACKUP

echo "Restore complete!"

