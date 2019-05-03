USE [AddressBook]
GO

IF OBJECT_ID('dbo.Address', 'U') IS NOT  NULL
BEGIN
      ALTER TABLE [dbo].[Address] SET (SYSTEM_VERSIONING = OFF)
      DROP TABLE [dbo].[Address]
      DROP TABLE [dbo].[AddressHistory]
END


CREATE TABLE [dbo].[Address]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ContactId] [int] NOT NULL REFERENCES [dbo].[Contact]([id]) ,
	[Address1] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[ProvinceStateId] [int] NOT NULL REFERENCES [dbo].[ProvinceState] ([Id]),
	[PostalZip] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[CountryId] [int] NOT NULL REFERENCES [dbo].[Country] ([Id]) ,
	[CreatedDate] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
	[ModifiedDate] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (CreatedDate, ModifiedDate)
	
)
WITH
(
   SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[AddressHistory])
)

