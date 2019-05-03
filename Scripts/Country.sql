USE [AddressBook]
GO

IF OBJECT_ID('dbo.[Country]', 'U') IS NOT  NULL
BEGIN
      ALTER TABLE [dbo].[Country] SET (SYSTEM_VERSIONING = OFF)
      DROP TABLE [dbo].[Country]
END


CREATE TABLE [dbo].[Country]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nchar](10) NOT NULL
)
WITH
(
   SYSTEM_VERSIONING = ON 
)
