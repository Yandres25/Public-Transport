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

## Vistas

### 1. vista_boletos_detalle

**Descripción:**  
Muestra los detalles de cada boleto, incluyendo el ID del boleto, el nombre del usuario, la fecha del viaje, la ruta y el precio.

**Uso:**  
Para consultar los detalles de los boletos, ejecuta:  
`SELECT * FROM "Yordy Soto".vista_boletos_detalle;`

---

### 2. vista_capacidad_total_buses_activos

**Descripción:**  
Calcula la capacidad total de todos los buses que se encuentran en estado **Activo**, sumando la capacidad de cada uno.

**Uso:**  
Para obtener la capacidad total de buses activos, ejecuta:  
`SELECT * FROM "Yordy Soto".vista_capacidad_total_buses_activos;`

---

### 3. vista_promedio_pasajeros

**Descripción:**  
Calcula el promedio (redondeado) de pasajeros totales registrados en los viajes.

**Uso:**  
Para consultar el promedio de pasajeros, ejecuta:  
`SELECT * FROM "Yordy Soto".vista_promedio_pasajeros;`

---

### 4. vista_top_viajes

**Descripción:**  
Muestra los 5 viajes con mayor cantidad de boletos vendidos, ordenados de mayor a menor.

**Uso:**  
Para consultar los viajes con mayor número de boletos vendidos, ejecuta:  
`SELECT * FROM "Yordy Soto".vista_top_viajes;`

---

## Procedimientos

### 1. actualizar_estado_bus

**Descripción:**  
Actualiza el estado de un bus. Recibe el ID del bus y el nuevo estado, y actualiza el campo `estado_bus_id` en la tabla `buses`.

**Uso:**  
Para actualizar el estado de un bus, ejecuta:  
`CALL "Yordy Soto".actualizar_estado_bus(<id_bus>, <nuevo_estado>);`

---

### 2. registrar_usuario

**Descripción:**  
Inserta un nuevo usuario en la tabla `usuarios`, registrando su nombre, el ID del tipo de tarifa y la fecha de nacimiento.

**Uso:**  
Para registrar un nuevo usuario, ejecuta:  
`CALL "Yordy Soto".registrar_usuario('Nombre', <tipo_tarifa_id>, 'YYYY-MM-DD');`

---

## Funciones

### 1. boletos_vendidos_viaje

**Descripción:**  
Retorna la cantidad de boletos vendidos para un viaje específico, contando los registros en la tabla `boletos` que coinciden con el ID del viaje.

**Uso:**  
Para obtener el número de boletos vendidos en un viaje, ejecuta:  
`SELECT "Yordy Soto".boletos_vendidos_viaje(<id_viaje>);`

---

### 2. calcular_edad_usuario

**Descripción:**  
Calcula la edad de un usuario basándose en su fecha de nacimiento. Si la fecha de nacimiento es nula, retorna 0.

**Uso:**  
Para calcular la edad de un usuario, ejecuta:  
`SELECT "Yordy Soto".calcular_edad_usuario(<id_usuario>);`

---

## Restauración

Para restaurar el backup en una base de datos PostgreSQL, ejecuta:

```bash
psql -U <usuario> -d <nombre_base_de_datos> -f backup.sql
