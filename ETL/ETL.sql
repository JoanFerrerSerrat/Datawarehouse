IF NOT EXISTS(
    SELECT 1
    FROM INFORMATION_SCHEMA.SCHEMATA
    WHERE SCHEMA_NAME = 'ETL')
BEGIN
    EXEC('CREATE SCHEMA ETL AUTHORIZATION dbo')
END
GO
