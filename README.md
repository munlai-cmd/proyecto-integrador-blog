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
## 12. Recuperación y mantenimiento

Para iniciar o recuperar los servicios definidos en Docker Compose:

    ./scripts/deploy.sh

Para consultar el estado de los contenedores:

    ./scripts/verificar.sh

Para consultar los registros de un servicio:

    sudo docker compose logs --tail=50 wordpress

Para reiniciar todos los servicios:

    sudo docker compose restart

Los datos persistentes se conservan en los volúmenes de Docker.
No eliminar los volúmenes al realizar tareas de mantenimiento,
ya que contienen los datos de la aplicación y la monitorización.

## 13. Limitaciones

La monitorización actual recopila métricas del sistema mediante
Node Exporter y comprueba la disponibilidad de los objetivos
configurados en Prometheus. No realiza por sí sola una prueba HTTP
de WordPress ni una comprobación detallada del funcionamiento
interno de MariaDB.

## Monitoreo HTTP con Blackbox Exporter

El proyecto utiliza Blackbox Exporter para comprobar periódicamente la disponibilidad HTTP de WordPress. Prometheus consulta el resultado de las pruebas y Grafana permite visualizar el estado del servicio.

Componentes de monitoreo:
- Prometheus: recopila y almacena las métricas.
- Node Exporter: expone métricas del sistema operativo Ubuntu.
- Blackbox Exporter: realiza pruebas HTTP al servicio WordPress.
- Grafana: presenta métricas y paneles de monitoreo.

La configuración del monitor HTTP se encuentra en:
- `blackbox/blackbox.yml`
- `prometheus/prometheus.yml`

La métrica `probe_success` indica el resultado de la prueba HTTP:
- `1`: la prueba se considera exitosa.
- `0`: la prueba falló.

La disponibilidad puede consultarse en Grafana mediante la consulta:

`probe_success{job="wordpress_http", instance="http://blog_wordpress"}`

El nombre `blog_wordpress` corresponde a una dirección interna de la red Docker; para acceder al sitio desde el navegador del equipo anfitrión se utiliza `http://localhost:8080`.
