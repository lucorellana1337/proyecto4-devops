#!/bin/bash

DB_USER="${MYSQL_USER:-root}"
DB_PASSWORD="${MYSQL_PASSWORD:-admin}"
DB_HOST="${MYSQL_HOST:-localhost}"
DB_NAME="${MYSQL_DB:-testdb}"

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

if mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"; then
    echo "Backup realizado correctamente: $BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"
else
    echo "Error en el backup"
    exit 1
fi
