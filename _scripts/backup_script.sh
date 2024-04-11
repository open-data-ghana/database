#!/bin/bash

# Directory paths
DB_BACKUP_DIR="./backup"
DATABASE_DIR="./_database"
TABLES_DIR="./_tables"
DATA_DIR="./data"

# Create backup directory if not exists
mkdir -p $DB_BACKUP_DIR

# Backup schema and create database script
cp $DATABASE_DIR/schema.sql $DB_BACKUP_DIR
cp $DATABASE_DIR/create_database.sql $DB_BACKUP_DIR

# Backup table schemas
cp -r $TABLES_DIR $DB_BACKUP_DIR

# Backup data
cp -r $DATA_DIR $DB_BACKUP_DIR

# Compress the backup directory
tar -zcvf backup_$(date +"%Y%m%d_%H%M%S").tar.gz $DB_BACKUP_DIR

# Remove temporary backup files
rm -rf $DB_BACKUP_DIR
