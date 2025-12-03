#!/bin/bash

# Variables
BACKUP_DIR="/opt/backups"
DATE=$(date +%Y%m%d_%H%M%S)
DB_HOST="localhost"
DB_NAME="springdb"
DB_USER="springuser"

# Create backup directory
mkdir -p $BACKUP_DIR/db
mkdir -p $BACKUP_DIR/app

# Database backup
mysqldump -h $DB_HOST -u $DB_USER -p${DB_PASSWORD} $DB_NAME | gzip > $BACKUP_DIR/db/backup_$DATE.sql.gz

# Application backup (if needed)
tar -czf $BACKUP_DIR/app/app_backup_$DATE.tar.gz /opt/spring-app/

# Remove backups older than 7 days
find $BACKUP_DIR/db -name "*.sql.gz" -mtime +7 -delete
find $BACKUP_DIR/app -name "*.tar.gz" -mtime +7 -delete

# Sync to S3 (optional - if using AWS)
# aws s3 sync $BACKUP_DIR s3://your-bucket/backups/

echo "Backup completed at $(date)"
