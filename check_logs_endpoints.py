import requests
import os
from datetime import datetime

# Configuración
LOG_FILE = "./app.log"
ENDPOINTS = [
    "http://localhost:8080/productos",
    "http://localhost:8080/status"
]

# Crear log simulado si no existe
def crear_log_simulado():
    if not os.path.exists(LOG_FILE):
        with open(LOG_FILE, "w", encoding="utf-8") as f:
            f.write(f"{datetime.now()} INFO Aplicación iniciada\n")
            f.write(f"{datetime.now()} INFO Endpoint /productos probado correctamente\n")
            f.write(f"{datetime.now()} ERROR No se pudo conectar a la base de datos\n")
            f.write(f"{datetime.now()} INFO Endpoint /status probado correctamente\n")
        print(f"Log simulado creado: {LOG_FILE}")

# Revisar logs
def check_logs():
    if not os.path.exists(LOG_FILE):
        print(f"Archivo {LOG_FILE} no encontrado.")
        crear_log_simulado()

    print("\nÚltimas líneas del log:")
    with open(LOG_FILE, "r", encoding="utf-8") as f:
        lines = f.readlines()
        for line in lines[-10:]:  # Mostrar últimas 10 líneas
            print(line.strip())

# Testear endpoints
def test_endpoints():
    print("\nProbando endpoints...")
    for url in ENDPOINTS:
        try:
            r = requests.get(url, timeout=5)
            print(f"{url} → Status: {r.status_code}")
        except Exception as e:
            print(f"{url} → Error: {e}")

if __name__ == "__main__":
    print(f"Script ejecutado en: {datetime.now()}")
    crear_log_simulado()
    check_logs()
    test_endpoints()
