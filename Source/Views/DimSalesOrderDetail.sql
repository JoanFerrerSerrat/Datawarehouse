IF EXISTS(
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'Source'
      AND TABLE_NAME = 'DimSalesOrderDetail')
DROP VIEW Source.DimSalesOrderDetail
GO
CREATE VIEW Source.DimSalesOrderDetail AS
SELECT                   
    sod.SalesOrderDetailID,                                               
    ISNULL(sod.CarrierTrackingNumber, '')    AS CarrierTrackingNumber, 
    sod.[ModifiedDate]                       AS ModifiedDate
    --COALESCE(dc.CurrencyKey, (SELECT CurrencyKey FROM dbo.DimCurrency WHERE CurrencyAlternateKey = N'USD')) AS CurrencyKey, --Updated to match OLTP which uses the RateID not the currency code.
    --soh.TerritoryID AS SalesTerritoryKey, --DW key mapping to SalesTerritory
FROM AdventureWorks2016_EXT.Sales.SalesOrderDetail sod
GO
