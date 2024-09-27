CREATE TABLE pokes (foo INT, bar STRING);

LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;