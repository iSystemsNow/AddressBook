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

CREATE TABLE [dbo].[Contact_H] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (255) NOT NULL,
    [LastName] VARCHAR (255) NOT NULL,
    [Title] VARCHAR(10) NOT NULL,
    [Gender] CHAR(1) NULL,
    [DateOfBirth] DATE NULL,
    [CreatedDate] DATETIME2 NULL,
    [ModifiedDate] DATETIME2 NULL,
    [Active] BIT NULL,
	[TableId] INT NOT NULL,
	[Action] VARCHAR (10) NOT NULL
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

CREATE TABLE [dbo].[Address_H] (
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
	[TableId] INT NOT NULL,
	[Action] VARCHAR (10) NOT NULL,
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
    [Code] CHAR(3)  NOT NULL
	  PRIMARY KEY (Id)
);

INSERT INTO [dbo].[Country]([Name], [Code])
VALUES ('United States','USA'),
		('Canada','CA');

INSERT INTO [dbo].[ProvinceState]([Name], [Code],[CountryId]) VALUES
('Alabama, US','AL',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Alaska, US','AK',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Arizona, US','AZ',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Arkansas, US','AR',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Armed Forces America','AA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Armed Forces Europe','AE',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Armed Forces Pacific','AP',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('California, US','CA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Colorado, US','CO',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Connecticut, US','CT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Delaware, US','DE',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('District of Columbia, US','DC',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Florida, US','FL',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Georgia, US','GA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Hawaii, US','HI',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Idaho, US','ID',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Illinois, US','IL',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Indiana, US','IN',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Iowa, US','IA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Kansas, US','KS',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Kentucky, US','KY',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Louisiana, US','LA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Maine, US','ME',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Maryland, US','MD',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Massachusetts, US','MA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Michigan, US','MI',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Minnesota, US','MN',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Mississippi, US','MS',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Missouri, US','MO',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Montana, US','MT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Nebraska, US','NE',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Nevada, US','NV',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('New Hampshire, US','NH',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('New Jersey, US','NJ',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('New Mexico, US','NM',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('New York, US','NY',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('North Carolina, US','NC',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('North Dakota, US','ND',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Ohio, US','OH',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Oklahoma, US','OK',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Oregon, US','OR',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Pennsylvania, US','PA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Rhode Island, US','RI',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('South Carolina, US','SC',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('South Dakota, US','SD',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Tennessee, US','TN',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Texas, US','TX',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Utah, US','UT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Vermont, US','VT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Virginia, US','VA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Washington, US','WA',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('West Virginia, US','WV',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Wisconsin, US','WI',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Wyoming, US','WY',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'United States')),
('Alberta, CA','AB',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('British Columbia, CA','BC',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Manitoba, CA','MB',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('New Brunswick, CA','NB',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Newfoundland and Labrador, CA','NL',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Northwest Territories, CA','NT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Nova Scotia, CA','NS',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Nunavut, CA','NU',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Ontario, CA','ON',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Prince Edward Island, CA','PE',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Quebec, CA','QC',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Saskatchewan, CA','SK',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada')),
('Yukon, CA','YT',(SELECT  Id FROM [dbo].[Country] WHERE [Name] = 'Canada'))

ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_ContactId FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact]([Id]);
ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_ProvinceStateId	FOREIGN KEY ([ProvinceStateId]) REFERENCES [dbo].[ProvinceState]([Id]);
ALTER TABLE [dbo].[Address] ADD CONSTRAINT FK_Address_CountryId	FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country]([Id]);
ALTER TABLE [dbo].[ProvinceState] ADD CONSTRAINT FK_ProvinceState_CountryId	FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country]([Id]);