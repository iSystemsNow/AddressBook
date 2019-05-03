USE [AddressBook]
GO

IF OBJECT_ID('dbo.[ProvinceState]', 'U') IS NOT  NULL
BEGIN
      ALTER TABLE [dbo].[ProvinceState] SET (SYSTEM_VERSIONING = OFF)
      DROP TABLE [dbo].[ProvinceState]
END

CREATE TABLE [dbo].[ProvinceState]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,	    
	
	CONSTRAINT [FK_ProvinceState_Country] FOREIGN KEY([CountryId])
    REFERENCES [dbo].[Country] ([Id])
    ON DELETE CASCADE    
    ON UPDATE CASCADE    
)
WITH
(
   SYSTEM_VERSIONING = ON 
)


