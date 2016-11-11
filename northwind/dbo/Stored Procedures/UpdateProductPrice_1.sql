CREATE PROCEDURE [dbo].[UpdateProductPrice]
	(@productid int,
	@productprice money
	)
	AS
	UPDATE [dbo].[Products]
	SET [UnitPrice] = @productprice
	WHERE [ProductID] = @productid
