-- docker exec -it oracle_base bash
-- sqlplus sys@localhost:1521/FREEPDB1 as sysdba
-- @/docker-entrypoint-initdb.d/init.sql
-- 创建新用户
CREATE USER marmot IDENTIFIED BY "ilvTD123";
-- sqlplus marmot@localhost:1521/FREEPDB1

-- 授予必要的权限
GRANT CONNECT, RESOURCE TO marmot;

-- 如果需要更多权限，可以根据需求授予
-- GRANT DBA TO myuser;

