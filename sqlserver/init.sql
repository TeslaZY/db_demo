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

select  count(*) from A8_Daily_Sales_Details adsd ;

use master;

CREATE USER marmot FOR LOGIN marmot;
GRANT SELECT, INSERT, UPDATE, ALTER ON SCHEMA::dbo TO marmot;