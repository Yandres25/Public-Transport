# Backup de Transporte Público

Este repositorio contiene el backup de la base de datos del sistema de transporte público realizado con PostgreSQL.

## Descripción

- **Base de datos:** Transporte Público
- **Dump de:** PostgreSQL versión 16.8 (pg_dump versión 17.1)
- **Fecha del dump:** 2025-03-07

## Estructura de la Base de Datos

La base de datos se encuentra en el esquema `"Yordy Soto"` y contiene las siguientes tablas:

- **boletos:** Registra la venta de boletos, relacionando viajes y usuarios.  
- **buses:** Información de los buses, incluyendo número, capacidad y estado.  
- **estado_bus:** Define el estado de los buses (Activo, Fuera de servicio, En mantenimiento).  
- **rutas:** Detalles de rutas con origen, destino y duración del viaje.  
- **tipo_tarifa:** Tipos de tarifas (Adulto Mayor, Estudiante, Normal, Deportista).  
- **usuarios:** Datos de los usuarios del sistema.  
- **viajes:** Información de los viajes, con fecha, hora de salida/llegada y cantidad de pasajeros.

## Diagrama Entidad Relación

![ERD public transport](https://github.com/user-attachments/assets/cb306565-9d9e-4649-a6ba-aa4b29c7bebf)

## Restauración

Para restaurar el backup en una base de datos PostgreSQL, ejecuta:

```bash
psql -U <usuario> -d <nombre_base_de_datos> -f backup.sql
