#!/bin/bash

set -u

PROYECTO_DIR="$HOME/proyecto-integrador"

echo "======================================"
echo " Verificación del proyecto integrador"
echo "======================================"

cd "$PROYECTO_DIR" || exit 1

echo
echo "[1/3] Comprobando Docker..."

if ! sudo docker info >/dev/null 2>&1; then
    echo "ERROR: Docker no está disponible."
    exit 1
fi

echo "Docker está funcionando."

echo
echo "[2/3] Comprobando los contenedores..."

if ! sudo docker compose ps --status running --services | grep -qx wordpress; then
    echo "WordPress no está activo. Intentando iniciar los servicios..."
    sudo docker compose up -d || exit 1
fi

if ! sudo docker compose ps --status running --services | grep -qx mariadb; then
    echo "MariaDB no está activo. Intentando iniciar los servicios..."
    sudo docker compose up -d || exit 1
fi

echo
echo "[3/3] Estado actual de los servicios:"
sudo docker compose ps

echo
echo "Verificación finalizada."
