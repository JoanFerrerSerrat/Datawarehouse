IF NOT EXISTS(
    SELECT 1
    FROM INFORMATION_SCHEMA.SCHEMATA
    WHERE SCHEMA_NAME = 'ExtDWH')
BEGIN
    EXEC('CREATE SCHEMA ExtDWH AUTHORIZATION dbo')
END
GO
