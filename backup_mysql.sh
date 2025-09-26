#!/bin/bash

# Configuración
DB_USER="root"                # Cambia si usas otro usuario
DB_PASSWORD="admin"  # Pon tu contraseña de MySQL
DB_NAME="testdb"  # Pon el nombre de tu base de datos
BACKUP_DIR="./backups"

# Crear carpeta si no existe
mkdir -p $BACKUP_DIR

# Fecha actual
DATE=$(date +"%Y%m%d_%H%M%S")

# Archivo de backup
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Ejecutar backup
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Verificar si se hizo el backup
if [ $? -eq 0 ]; then
    echo "Backup realizado correctamente: $BACKUP_FILE"
else
    echo "Error en el backup"
    exit 1
fi
