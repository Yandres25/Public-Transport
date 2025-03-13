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

## Consultas sugeridas

## 📌 Vistas

### 1. `vista_usuarios_activos`
Muestra una lista de usuarios activos en la plataforma.

```sql
CREATE VIEW vista_usuarios_activos AS
SELECT id, nombre, email
FROM usuarios
WHERE estado = 'activo';
```

- **Campos:** `id`, `nombre`, `email`
- **Uso:** Se usa para obtener rápidamente la lista de usuarios activos.

### 2. `vista_ventas_mensuales`
Muestra el total de ventas agrupadas por mes.

```sql
CREATE VIEW vista_ventas_mensuales AS
SELECT DATE_TRUNC('month', fecha) AS mes, SUM(total) AS total_ventas
FROM ventas
GROUP BY mes;
```

- **Campos:** `mes`, `total_ventas`
- **Uso:** Permite analizar las ventas mensuales.

## ⚙️ Funciones

### 1. `calcular_descuento`
Calcula el descuento aplicado a un producto según el porcentaje.

```sql
CREATE FUNCTION calcular_descuento(precio NUMERIC, descuento NUMERIC) RETURNS NUMERIC AS $$
BEGIN
  RETURN precio - (precio * descuento / 100);
END;
$$ LANGUAGE plpgsql;
```

- **Parámetros:** `precio`, `descuento`
- **Retorno:** Precio final con descuento aplicado.
- **Uso:** `SELECT calcular_descuento(100, 10); -- Retorna 90`

## 🔄 Procedimientos

### 1. `registrar_nueva_venta`
Registra una nueva venta en la base de datos.

```sql
CREATE PROCEDURE registrar_nueva_venta(IN cliente_id INT, IN monto NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO ventas (cliente_id, total, fecha)
  VALUES (cliente_id, monto, NOW());
END;
$$;
```

- **Parámetros:** `cliente_id`, `monto`
- **Uso:** `CALL registrar_nueva_venta(1, 250.00);`

---

## Restauración

Para restaurar el backup en una base de datos PostgreSQL, ejecuta:

```bash
psql -U <usuario> -d <nombre_base_de_datos> -f backup.sql
