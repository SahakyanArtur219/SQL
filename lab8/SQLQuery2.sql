USE NORTHWND
GO
CREATE PROCEDURE GetChProducts
AS
BEGIN
SELECT ProductName
FROM Products
WHERE ProductName = 'Ch%' AND UnitPrice <=20;
END


EXEC GetCheapChProducts