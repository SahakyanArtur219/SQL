USE NORTHWND
GO
CREATE TRIGGER PreventPhoneUpdate
ON Customers
FOR UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted INNER JOIN deleted ON inserted.CustomerID = deleted.CustomerID
               WHERE inserted.Phone <> deleted.Phone)
    BEGIN
        RAISERROR ('Updating the Phone column is not allowed.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

UPDATE Customers SET Phone = '115-111-1111' WHERE CustomerID = 'ALFKI';

DROP TRIGGER PreventPhoneUpdate