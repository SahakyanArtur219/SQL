USE NORTHWND
GO

IF OBJECT_ID('ExistProducts', 'P') IS NOT NULL
    DROP PROCEDURE ExistProducts;
GO

CREATE PROCEDURE ExistProducts
WITH ENCRYPTION
AS
BEGIN
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitsInStock > 0
END
GO
EXEC ExistProducts