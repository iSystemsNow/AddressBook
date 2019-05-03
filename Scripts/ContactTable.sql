USE [AddressBook]
GO

IF OBJECT_ID('dbo.Contact', 'U') IS NOT  NULL
BEGIN
      ALTER TABLE [dbo].[Contact] SET (SYSTEM_VERSIONING = OFF)
      DROP TABLE [dbo].[Contact]
      DROP TABLE [dbo].[ContactHistory]
END

CREATE TABLE [dbo].[Contact]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CreatedDate] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
	[ModifiedDate] [datetime2]GENERATED ALWAYS AS ROW END NOT NULL,
	[Active] [nvarchar](50) NOT NULL,
	PERIOD FOR SYSTEM_TIME (CreatedDate, ModifiedDate)
)
	
WITH
(
   SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[ContactHistory])
)


