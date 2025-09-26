#!/bin/bash
set -e

echo "Ejecutando backup de MySQL..."

# Variables desde GitHub Actions
USER="${MYSQL_USER:-root}"
PASS="${MYSQL_PASSWORD:-admin}"
HOST="${MYSQL_HOST:-127.0.0.1}"
DB="${MYSQL_DB:-testdb}"

BACKUP_FILE="backup_$(date +%Y%m%d_%H%M%S).sql"

# Usar --password= para evitar warning
if mysqldump -h "$HOST" -u "$USER" --password="$PASS" "$DB" > "$BACKUP_FILE"; then
  echo "Backup exitoso en $BACKUP_FILE"
else
  echo "Error en el backup"
  exit 1
fi
