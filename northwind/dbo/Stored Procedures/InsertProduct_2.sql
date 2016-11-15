CREATE PROCEDURE [dbo].[InsertProduct]
	(@ProductName nvarchar(40),
     @SupplierID int,
     @CategoryID int,
     @QuantityPerUnit nvarchar(20),
     @UnitPrice money,
     @UnitsInStock smallint,
     @UnitsOnOrder smallint,
     @ReorderLevel smallint,
     @Discontinued bit)
AS
	INSERT INTO [dbo].[Products]
	([ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued])
VALUES
(@ProductName,
@SupplierID,
@CategoryID,
@QuantityPerUnit,
@UnitPrice,
@UnitsInStock,
@UnitsOnOrder,
@ReorderLevel,
@Discontinued)
