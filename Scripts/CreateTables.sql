IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL DROP TABLE [dbo].[Address];
IF OBJECT_ID('dbo.ProvinceState', 'U') IS NOT NULL DROP TABLE [dbo].[ProvinceState];
IF OBJECT_ID('dbo.Contact', 'U') IS NOT NULL DROP TABLE [dbo].[Contact];
IF OBJECT_ID('dbo.Country', 'U') IS NOT NULL DROP TABLE [dbo].[Country];

IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL ALTER TABLE [dbo].[Address] DROP CONSTRAINT FK_ContactId;
IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL ALTER TABLE [dbo].[Address] DROP CONSTRAINT FK_ProvinceStateId;
IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL ALTER TABLE [dbo].[Address] DROP CONSTRAINT FK_Address_CountryId;
IF OBJECT_ID('dbo.ProvinceState', 'U') IS NOT NULL ALTER TABLE [dbo].[ProvinceState] DROP CONSTRAINT FK_ProvinceState_ContactId;

CREATE TABLE [dbo].[Contact] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (255) NOT NULL,
    [LastName] VARCHAR (255) NOT NULL,
    [Title] VARCHAR(10) NOT NULL,
    [Gender] CHAR(1) NULL,
    [DateOfBirth] DATE NULL,
	[CreatedDate] DATETIME2 NULL,
	[ModifiedDate] DATETIME2 NULL,
	[Active] BIT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE [dbo].[Address] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [ContactId] INT NOT NULL,
    [Address1] VARCHAR (255) NOT NULL,
    [Address2] VARCHAR (255) NULL,
    [City] VARCHAR (255) NOT NULL,
    [ProvinceStateId] INT NOT NULL,
	[PostalZip] VARCHAR (10) NOT NULL,
	[PhoneNumber] VARCHAR (10) NOT NULL,
	[CountryId] INT NOT NULL,
	[CreatedDate] DATETIME2 NULL,
	[ModifiedDate] DATETIME2 NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE [dbo].[ProvinceState] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (255) NOT NULL,
    [Code] CHAR(2) NOT NULL,
	[CountryId] INT NOT NULL
	PRIMARY KEY (Id)
);

CREATE TABLE [dbo].[Country] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (255) NOT NULL,
    [Code] INT NOT NULL
	PRIMARY KEY (Id)
);

ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_ContactId FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact]([Id]);
ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_ProvinceStateId	FOREIGN KEY ([ProvinceStateId]) REFERENCES [dbo].[ProvinceState]([Id]);
ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_Address_CountryId	FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country]([Id]);

ALTER TABLE [dbo].[ProvinceState] ADD CONSTRAINT FK_ProvinceState_CountryId	FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country]([Id]);

IF OBJECT_ID('dbo.Address_H', 'U') IS NOT NULL DROP TABLE [dbo].[Address_H];
IF OBJECT_ID('dbo.Contact_H', 'U') IS NOT NULL DROP TABLE [dbo].[Contact_H];

SELECT * INTO [dbo].[Contact_H] FROM [dbo].[Contact] WHERE 1 = 2
SELECT * INTO [dbo].[Address_H] FROM [dbo].[Address] WHERE 1 = 2