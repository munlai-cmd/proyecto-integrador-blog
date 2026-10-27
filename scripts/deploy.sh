#!/bin/bash

set -e

echo "===================================="
echo " Despliegue del proyecto integrador"
echo "===================================="

echo "[1/3] Comprobando Docker..."
if ! sudo docker info >/dev/null 2>&1; then
    echo "ERROR: Docker no está disponible."
    exit 1
fi

echo "Docker está funcionando."

echo
echo "[2/3] Validando configuración..."
sudo docker compose config -q
echo "Configuración válida."

echo
echo "[3/3] Iniciando servicios..."
sudo docker compose up -d

echo
echo "Estado de los servicios:"
sudo docker compose ps

echo
echo "Despliegue finalizado."
