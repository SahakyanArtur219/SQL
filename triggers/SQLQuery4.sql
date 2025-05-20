USE NORTHWND
GO

SELECT 
    tr.name AS TriggerName,
    tb.name AS TableName,
    tr.is_disabled AS IsDisabled,
    tr.create_date,
    tr.modify_date
FROM sys.triggers tr
JOIN sys.tables tb ON tr.parent_id = tb.object_id
ORDER BY TableName, TriggerName;
