#!/bin/bash
set -e

# Load env vars
set -a
source .env.backup
set +a

TIMESTAMP=$(date +"%F-%H-%M")
BACKUP_DIR="/home/michael/backups"
DB_BACKUP="$BACKUP_DIR/db_rimi_$TIMESTAMP.sql"
FILES_BACKUP="$BACKUP_DIR/files_rimi_$TIMESTAMP.tar.gz"

mkdir -p $BACKUP_DIR

echo "Dumping database..."
docker exec $(docker ps -qf name=db) mysqldump -u root -p$MYSQL_ROOT_PASSWORD $DATABASE_NAME > $DB_BACKUP

echo "Archiving uploaded files..."
docker cp $(docker ps -qf name=app):/var/www/html/files/ ./files_tmp/
tar -czvf $FILES_BACKUP ./files_tmp
rm -rf ./files_tmp

echo "Uploading backups to remote storage..."
# Example with rclone
# rclone copy $BACKUP_DIR remote:$REMOTE_BACKUP_PATH

echo "Cleaning old local backups (older than 7 days)..."
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;

echo "Backup completed successfully!"
