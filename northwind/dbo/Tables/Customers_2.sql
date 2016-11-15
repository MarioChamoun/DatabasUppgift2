CREATE TABLE [dbo].[Customers] (
    [CustomerID]   NCHAR (5)     NOT NULL,
    [CompanyName]  NVARCHAR (40) NOT NULL,
    [ContactName]  NVARCHAR (30) NULL,
    [ContactTitle] NVARCHAR (30) NULL,
    [Address]      NVARCHAR (60) NULL,
    [City]         NVARCHAR (15) NULL,
    [Region]       NVARCHAR (15) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Country]      NVARCHAR (15) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [City]
    ON [dbo].[Customers]([City] ASC);


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Customers]([CompanyName] ASC);


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Customers]([PostalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [Region]
    ON [dbo].[Customers]([Region] ASC);


GO
CREATE TRIGGER [dbo].[ContactNameTrigger]
ON [dbo].[Customers]
FOR UPDATE
AS
BEGIN
	declare @id nvarchar(5)
	declare @oldname nvarchar(50)
	declare @name nvarchar(50)
	
	select * into #TempTable from inserted

	while(exists(select CustomerID from #TempTable))
	begin

	select top 1 @id = CustomerID, @name = ContactName from #TempTable

	select @oldname = ContactName from deleted where CustomerID = @id

	if(@oldname <> @name)
	insert into TblOldCustomers (Id,Name,OldName) values (@id,@name,@oldname)

	Delete from #TempTable where CustomerID = @id
END
END