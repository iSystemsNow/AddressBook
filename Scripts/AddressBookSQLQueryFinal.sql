Create DATABASE [AddressBookDb];
GO
USE [AddressBookDb];
GO
--IF NOT EXISTS (SELECT * FROM [dbo].[Contact])
IF OBJECT_ID('dbo.Contact', 'U') IS NULL
BEGIN
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
END
IF OBJECT_ID('dbo.ContactHistory', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ContactHistory]
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
END
IF OBJECT_ID('dbo.Address', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Address]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ContactId] [int] NOT NULL REFERENCES [dbo].[Contact]([Id]) ,
	[Address1] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[ProvinceStateId] [int] NOT NULL,
	[PostalZip] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[CountryId] [int] NOT NULL,
	[CreatedDate] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
	[ModifiedDate] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (CreatedDate, ModifiedDate)
)
END
IF OBJECT_ID('dbo.AddressHistory', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[AddressHistory]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ContactId] [int] NOT NULL,
	[Address1] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[ProvinceStateId] [int] NOT NULL,
	[PostalZip] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[CountryId] [int] NOT NULL,
	[CreatedDate] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
	[ModifiedDate] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (CreatedDate, ModifiedDate)
)
END
IF OBJECT_ID('dbo.[ProvinceState]', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ProvinceState]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL     
)
END
IF OBJECT_ID('dbo.[Country]', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[Country]
(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nchar](2) NOT NULL
)
END
IF (OBJECT_ID('[FK_Address_ProvinceState]', 'F') IS NULL)
BEGIN
ALTER TABLE [dbo].[Address]  WITH CHECK ADD CONSTRAINT [FK_Address_ProvinceState] FOREIGN KEY([ProvinceStateId])
REFERENCES [dbo].[ProvinceState] ([Id])
END
IF (OBJECT_ID('[FK_Address_Country]', 'F') IS NULL)
BEGIN
ALTER TABLE [dbo].[Address]  WITH CHECK ADD CONSTRAINT [FK_Address_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
END
IF (OBJECT_ID('[FK_ProvinceState_Country]', 'F') IS NULL)
BEGIN
ALTER TABLE [dbo].[ProvinceState] WITH CHECK ADD CONSTRAINT [FK_ProvinceState_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
END

IF NOT EXISTS (SELECT 1 FROM [AddressBookDb].[dbo].[Country])
BEGIN
INSERT INTO [AddressBookDb].[dbo].[Country](Name, Code)
VALUES('Canada','CA'), ('USA','US')
END
IF NOT EXISTS(SELECT COUNT(*) FROM [AddressBookDb].[dbo].[ProvinceState])
BEGIN
INSERT INTO [AddressBookDb].[dbo].[ProvinceState](Name, Code, CountryId)
VALUES('Alabama, US','AL', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Alaska, US','AK', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Arizona, US','AZ', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Arkansas, US','AR', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Armed Forces America','AA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Armed Forces Europe','AE', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Armed Forces Pacific','AP', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('California, US','CA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Colorado, US','CO', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Connecticut, US','CT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Delaware, US','DE', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('District of Columbia, US','DC', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Florida, US','FL', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Georgia, US','GA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Hawaii, US','HI', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Idaho, US','ID', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Illinois, US','IL', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
   	  ('Indiana, US','IN', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Iowa, US','IA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
   	  ('Kansas, US','KS', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Kentucky, US','KY', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
	  ('Louisiana, US','LA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Maine, US','ME', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Maryland, US','MD', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Massachusetts, US','MA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Michigan, US','MI', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Minnesota, US','MN', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Mississippi, US','MS', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Missouri, US','MO', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Montana, US','MT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Nebraska, US','NE', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Nevada, US','NV', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('New Hampshire, US','NH', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('New Jersey, US','NJ', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('New Mexico, US','NM', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('New York, US','NY', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('North Carolina, US','NC', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')), 
      ('North Dakota, US','ND', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Ohio, US','OH', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Oklahoma, US','OK', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Oregon, US','OR', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Pennsylvania, US','PA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Rhode Island, US','RI', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('South Carolina, US','SC', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('South Dakota, US','SD', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Tennessee, US','TN', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Texas, US','TX', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Utah, US','UT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Vermont, US','VT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Virginia, US','VA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Washington, US','WA', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('West Virginia, US','WV', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Wisconsin, US','WI', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Wyoming, US','WY', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'US')),
      ('Alberta, CA','AB', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('British Columbia, CA','BC', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Manitoba, CA','MB', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('New Brunswick, CA','NB', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Newfoundland and Labrador, CA','NL', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Northwest Territories, CA','NT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Nova Scotia, CA','NS', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Nunavut, CA','NU', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Ontario, CA','ON', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Prince Edward Island, CA','PE', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Quebec, CA','QC', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Saskatchewan, CA','SK', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA')),
      ('Yukon, CA','YT', (SELECT Id from [AddressBookDb].[dbo].[Country] where Code = 'CA'));
END