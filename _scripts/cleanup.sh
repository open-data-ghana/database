#!/bin/bash

# Directory paths
DB_BACKUP_DIR="./backup"

# Remove old backup files
find $DB_BACKUP_DIR -type f -name 'backup_*.tar.gz' -mtime +7 -exec rm {} \;

# Remove empty directories
find $DB_BACKUP_DIR -type d -empty -delete
