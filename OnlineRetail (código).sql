# I. CREACIÓN DE BASE DE DATOS Y TABLAS

## Crear y usar una base de datos llamada OnlineRetail.
CREATE DATABASE OnlineRetail;
USE OnlineRetail;

## Crear una tabla (Transactions) para almacenar datos.
CREATE TABLE Transactions (
    Invoice VARCHAR(10),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(50)
);

## En el archivo Excel, se debe cambiar el formato de las fechas a "AAAA-MM-DD HH:MM:SS" para que SQL lo maneje correctamente.
## Además, la columna "Customer ID" en Excel contiene espacios en blanco, así que deben reemplazarse con "0" para evitar errores en la importación.
## La importación se hizo manualmente; opcionalmente, considere LOAD DATA INFILE o LOAD DATA LOCAL INFILE.



# II. CONSULTAS DE EXPLORACIÓN DE DATOS

## Cantidad de transacciones por país.alter
SELECT Country, COUNT(*) AS TransactionCount
FROM Transactions
GROUP BY Country
ORDER BY TransactionCount DESC
LIMIT 10;

## Productos más vendidos (por cantidad total).
SELECT StockCode, Description, SUM(Quantity) AS TotalSold
FROM Transactions
GROUP BY StockCode, Description
ORDER BY TotalSold DESC
LIMIT 10;

## Ingresos totales por país.
SELECT Country, SUM(Quantity * Price) AS TotalRevenue
FROM Transactions
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;

## Clientes con más compras (por cantidad total).
SELECT CustomerID, SUM(Quantity) AS TotalPurchases
FROM Transactions
GROUP BY CustomerID
ORDER BY TotalPurchases DESC
LIMIT 10;




# III. CONSULTAS DETALLADAS

## Facturas que incluyan productos con la descripción que contenga "HEART".
SELECT DISTINCT Invoice
FROM Transactions
WHERE Description LIKE '%HEART%'
LIMIT 10;

## Ventas por mes y año.
SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, SUM(Quantity * Price) AS MonthlyRevenue
FROM Transactions
GROUP BY Year, Month
ORDER BY Year, Month;

## Clientes que hayan realizado más de 50 transacciones.
SELECT CustomerID, COUNT(DISTINCT Invoice) AS TransactionCount
FROM Transactions
WHERE customerid <> 0
GROUP BY CustomerID
HAVING TransactionCount > 50
ORDER BY TransactionCount DESC
LIMIT 10;

## Productos que no se vendieron en ninguna transacción.
SELECT DISTINCT StockCode, Description
FROM Transactions
WHERE Quantity = 0;



# IV. CONSULTAS AVANZADAS

## Cálculo del ticket promedio por cliente.
SELECT CustomerID, AVG(Quantity * Price) AS AverageTicket
FROM Transactions
GROUP BY CustomerID
ORDER BY AverageTicket DESC
LIMIT 10;

## Transacciones con cantidades negativas (indicando devoluciones).
SELECT *
FROM Transactions
WHERE Quantity < 0
LIMIT 10;

## Ranking de productos por ingreso.
SELECT StockCode, Description, SUM(Quantity * Price) AS TotalRevenue
FROM Transactions
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC
LIMIT 10;

## Número de clientes únicos por país.
SELECT Country, COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Transactions
GROUP BY Country
ORDER BY UniqueCustomers DESC
LIMIT 10;



# V. CREACIÓN DE VISTAS Y PROCEDIMIENTOS ALMACENADOS

## Vista de ingresos por país.
CREATE VIEW CountryRevenue AS
SELECT Country, SUM(Quantity * Price) AS TotalRevenue
FROM Transactions
GROUP BY Country;
