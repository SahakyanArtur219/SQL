USE NORTHWND
GO
CREATE PROCEDURE OrdersByTime
	@OrderTime DATE
WITH ENCRYPTION
AS
BEGIN
SELECT C.ContactName, O.OrderDate
FROM Customers C
JOIN  Orders O
on C.CustomerID = O.CustomerID
WHERE O.OrderDate = @OrderTime
END
go
exec OrdersByTime @OrderTime = '1997-05-06';
