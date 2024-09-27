CREATE EXTERNAL CATALOG hive_catalog
PROPERTIES
(
    "type" = "hive",
    "hive.metastore.uris" = "thrift://hive-metastore:9083"
)


show catalogs;
SHOW CREATE CATALOG hive_catalog;

SHOW DATABASES FROM hive_catalog;


show databases;
 
DROP catalog hive_catalog;

set CATALOG  hive_catalog;

use hive_catalog.`default`;

show tables from hive_catalog.`default`;

select  count(*) from pokes;

use default_catalog.demo;
