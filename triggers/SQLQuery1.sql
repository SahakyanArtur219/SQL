USE NORTHWND
GO
CREATE TRIGGER PreventNullShipCountry
ON Orders
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ShipCountry IS NULL)
    BEGIN
        RAISERROR ('ShipCountry cannot be NULL ', 16, 1)
        ROLLBACK TRANSACTION
    END
END


INSERT INTO Orders (CustomerID, OrderDate, ShipCountry)
VALUES ('ALFKI', GETDATE(), null);
