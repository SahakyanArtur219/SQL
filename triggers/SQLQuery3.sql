USE NORTHWND
GO
CREATE TRIGGER trg_BlockOrderModifications
ON Orders
FOR UPDATE, DELETE
AS
BEGIN
    RAISERROR('Modifying or deleting orders is not allowed.', 16, 1);
    ROLLBACK TRANSACTION;
END;

DROP TRIGGER trg_BlockOrderModifications