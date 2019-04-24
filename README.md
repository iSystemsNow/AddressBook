Address Book Application

1. DB Structure

Contact Table + History Table

Id (PK)
FirstName
LastName
Title
Gender
DateOfBirth
CreatedDate
ModifiedDate
Active

Address Table + History Table

Id (PK)
ContactId (FK)
Address1
Address2
City
ProvinceStateId (FK)
PostalZip
PhoneNumber
CountryId (FK)
CreatedDate
ModifiedDate

ProvinceState Table (data is available here: https://www.ups.com/worldshiphelp/WS14/ENU/AppHelp/Codes/State_Province_Codes.htm)

Id (PK)
Name
Code
CountryId (FK)

Country Table (Canada & USA only)

Id (PK)
Name
Code

2. Summary - This application is intended to manage address books for a sales user 

3. These are the actions the system must able to complete (with error handling):
	A user must be able to complete the following:
Search contacts
Add contact
Edit contact
Delete contact
Open contact (Addresses available on list)
View contact history

Search addresses
Add address
Edit address
Delete address
Reassign address
View address history
	
System must be able to do:
On Insert Contact add History record
On Edit Contact add History record
On Delete Contact add History record

On Insert Address add History record
On Edit Address add History record
On Delete Address add History record

4. Languages system must use:
C#
T-Sql (Sql Server)
Data Layer must follow repository pattern
Entity Framework
UI - use what you are most comfortable with (must be web based)	

5. All sql scripts must be repeatable and contained within project.

Pluralsight support - Make sure you are doing the exercises and take notes
:
C#
https://app.pluralsight.com/player?course=csharp-fundamentals-csharp5&author=scott-allen&name=csharp-fundamentals-csharp5-m0&clip=0&mode=live

T-SQL
https://app.pluralsight.com/player?course=tsql-playbook&author=rob-conery&name=tsql-playbook-m1&clip=0&mode=live

Entity Framework
https://app.pluralsight.com/player?course=entity-framework-6-getting-started&author=julie-lerman&name=entity-framework-6-getting-started-m2&clip=3&mode=live


Web Base UI
Please research PluralSight for the UI solution you select (Angular, MVC, WebForms, etc.)

Module 1:

Create Database with data tables and data values (repeatable sql scripts ).
Create EF Data Models.

Module 2:

Create EF structure to support requirements.

Module 3:

Create UI
