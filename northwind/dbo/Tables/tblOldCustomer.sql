CREATE TABLE [dbo].[tblOldCustomer] (
    [Id]      INT           NOT NULL,
    [Name]    NVARCHAR (50) NOT NULL,
    [OldName] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

