# SQL - Análisis de Ventas Minoristas en Línea

Este proyecto implementa consultas en SQL para analizar datos transaccionales de una tienda minorista en línea, utilizando el conjunto de datos *Online Retail* disponible en Kaggle. El análisis abarca desde consultas exploratorias y detalladas hasta operaciones más avanzadas como vistas y ranking de productos.

## Conjunto de datos

El conjunto de datos contiene todas las transacciones registradas por una tienda minorista en línea con sede en el Reino Unido, entre el 1 de diciembre de 2009 y el 9 de diciembre de 2011. La empresa vende artículos de regalo exclusivos y opera sin tiendas físicas. Muchos de sus clientes son mayoristas.

Variables incluidas:

- `InvoiceNo`: Número de factura. Un identificador único para cada transacción. Las facturas que comienzan con "C" indican cancelaciones.
- `StockCode`: Código del producto.
- `Description`: Descripción del producto.
- `Quantity`: Cantidad de productos por transacción.
- `InvoiceDate`: Fecha y hora de la transacción.
- `UnitPrice`: Precio unitario en libras esterlinas (£).
- `CustomerID`: Identificador del cliente.
- `Country`: País del cliente.

Fuente: [Online Retail Dataset - Kaggle](https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset)

## Objetivos

- Crear e importar una base de datos relacional en MySQL.
- Ejecutar consultas para obtener estadísticas clave del negocio.
- Identificar patrones de compra y comportamiento de clientes.
- Implementar vistas para facilitar el análisis agregado.

## Contenido del análisis

### I. Creación de base de datos y tablas
- Creación de la base de datos `OnlineRetail` y de la tabla `Transactions`.
- Recomendaciones para el preprocesamiento previo a la importación.

### II. Consultas de exploración
- Cantidad de transacciones por país.
- Productos más vendidos.
- Ingresos totales por país.
- Clientes con más compras.

### III. Consultas detalladas
- Facturas con productos específicos.
- Ingresos por mes.
- Clientes con más de 50 transacciones.
- Productos no vendidos.

### IV. Consultas avanzadas
- Ticket promedio por cliente.
- Transacciones negativas (devoluciones).
- Ranking de productos por ingresos.
- Clientes únicos por país.

### V. Vistas
- Vista para ingresos por país (`CountryRevenue`).

---
Este proyecto es una muestra funcional del uso de SQL en análisis comercial aplicado a datos reales.
