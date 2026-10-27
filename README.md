# Proyecto integrador: Blog tecnológico

## 1. Descripción
Implementación de una plataforma web WordPress con MariaDB,
desplegada mediante Docker Compose sobre Ubuntu Server virtualizado
en Oracle VirtualBox.

El proyecto incorpora automatización mediante scripts Bash y
monitorización del servidor con Prometheus, Node Exporter y Grafana.

## 2. Arquitectura
- Virtualización: Oracle VirtualBox.
- Sistema operativo: Ubuntu Server 26.04.1 LTS.
- Contenedores: Docker y Docker Compose.
- Aplicación web: WordPress.
- Base de datos: MariaDB.
- Monitorización: Prometheus y Node Exporter.
- Visualización: Grafana.
- Automatización: Bash.

## 3. Puertos
- WordPress: http://localhost:8080
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000
- Node Exporter: puerto interno 9100.

Las direcciones localhost corresponden al equipo desde el que
se abre el navegador cuando los puertos están publicados allí.

## 4. Estructura
- docker-compose.yml: definición de los servicios.
- .env: variables de entorno y credenciales.
- prometheus/prometheus.yml: configuración de monitorización.
- scripts/deploy.sh: validación y despliegue.
- scripts/verificar.sh: comprobación de Docker y contenedores.
- README.md: instrucciones del proyecto.

## 5. Requisitos
- Ubuntu Server instalado en una máquina virtual.
- Docker Engine y complemento Docker Compose.
- Conexión a Internet para descargar las imágenes iniciales.

## 6. Despliegue
Desde el directorio del proyecto, ejecutar:

    ./scripts/deploy.sh

## 7. Verificación
Ejecutar:

    ./scripts/verificar.sh

También se puede consultar el estado con:

    sudo docker compose ps

## 8. Monitorización
Prometheus recopila métricas de Node Exporter.
Grafana permite visualizar el uso de CPU, memoria RAM y disco,
además del estado de los objetivos de monitorización.

## 9. Persistencia
Los datos de WordPress, MariaDB, Prometheus y Grafana se almacenan
en volúmenes de Docker definidos en docker-compose.yml.

## 10. Seguridad
El archivo .env contiene configuración sensible y no debe publicarse
en repositorios públicos. No incluir contraseñas reales en capturas
ni en la documentación entregada.

## 11. Pruebas realizadas
- Instalación y acceso a WordPress.
- Verificación del estado de MariaDB.
- Consulta de objetivos en Prometheus.
- Visualización de métricas en Grafana.
- Ejecución del script de verificación.
- Reinicio de los contenedores.
- Ejecución del script de despliegue.
