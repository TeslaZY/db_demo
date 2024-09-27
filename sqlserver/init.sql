CREATE LOGIN marmot WITH PASSWORD = 'ilvTD!@#';
-- DROP USER marmot;

CREATE database demo;
-- DROP SCHEMA demo;

use demo;

CREATE USER marmot FOR LOGIN marmot;

-- 授予 marmot 用户对 test 模式的特定权限
GRANT SELECT, INSERT, UPDATE, ALTER ON SCHEMA::dbo TO marmot;

SELECT * FROM sys.schemas WHERE name = 'dbo';

SELECT * FROM sys.database_principals WHERE name = 'marmot';

SELECT * FROM sys.database_permissions WHERE grantee_principal_id = (SELECT principal_id FROM sys.database_principals WHERE name = 'marmot');

-- DELETE FROM demo.dbo.A8_Store_List; 


-- demo.dbo.[A8_2022_Sales_Targets_for_Each_Store.csv] definition

-- Drop table

-- DROP TABLE demo.dbo.[A8_2022_Sales_Targets_for_Each_Store.csv];

CREATE TABLE demo.dbo.[A8_2022_Sales_Targets_for_Each_Store.csv] (
	[Store Number] int NULL,
	[ Sales Target] int NULL
);


-- demo.dbo.[A8_2022_Store_Foot_Traffic.csv] definition

-- Drop table

-- DROP TABLE demo.dbo.[A8_2022_Store_Foot_Traffic.csv];

CREATE TABLE demo.dbo.[A8_2022_Store_Foot_Traffic.csv] (
	[Date] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Store Number] int NULL,
	[Foot Traffic] int NULL,
	[Number of Visitors] int NULL
);


-- demo.dbo.A8_Daily_Sales_Details definition

-- Drop table

-- DROP TABLE demo.dbo.A8_Daily_Sales_Details;

CREATE TABLE demo.dbo.A8_Daily_Sales_Details (
	[Date] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product Category] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Store Number] int NULL,
	[Daily Sales] int NULL
);


-- demo.dbo.A8_Store_List definition

-- Drop table

-- DROP TABLE demo.dbo.A8_Store_List;

CREATE TABLE demo.dbo.A8_Store_List (
	[Store Number] int NULL,
	[Store Name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	City nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Province nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);