docker network create --driver bridge \
  --subnet 172.18.0.0/24 \
  --ip-range 172.18.0.0/24 \
  --gateway 172.18.0.1 \
  tubo-database-net

docker run -p 28080:8080 -itd \
-v ./presto/config.properties:/opt/presto-server/etc/config.properties \
-v ./presto/jvm.config:/opt/presto-server/etc/jvm.config \
-v ./presto/core-site.xml:/etc/hadoop/core-site.xml \
-v ./presto/hdfs-site.xml:/etc/hadoop/hdfs-site.xml \
-v ./presto/tpch.properties:/opt/presto-server/etc/catalog/tpch.properties \
-v ./presto/hive.properties:/opt/presto-server/etc/catalog/hive.properties \
--name presto \
--network tubo-database-net \
prestodb/presto:latest



docker cp presto:/opt/presto-server/etc/catalog/hive.properties  ./
docker cp presto:/opt/presto-server/etc/catalog/tpch.properties ./

docker stop namenode datanode hive-server hive-metastore hive-metastore-postgresql oracle sql-server 
docker remove namenode datanode hive-server hive-metastore hive-metastore-postgresql


docker run -itd -p 38080:8080 \
-v ./tpcds.properties:/etc/trino/catalog/tpcds.properties \
-v ./tpch.properties:/etc/trino/catalog/tpch.properties \
--network tubo-database-net \
--name trino \
trinodb/trino 

  docker run -itd --name=doris1 \
  --network tubo-database-networks --ip 172.21.0.5 \
  -p 19030:19030 -p 18030:18030 \
  -v ./fe.conf:/opt/apache-doris-2.1.6-bin-x64/fe/conf/fe.conf \
  -v ./be.conf:/opt/apache-doris-2.1.6-bin-x64/be/conf/be.conf \
  tubo/doris \
  /bin/bash -c "top"

    docker run -itd --name=doris1 \
  --network tubo-database-networks --ip 172.21.0.5 \
  -p 19030:19030 -p 18030:18030 \
  tubo/doris \
  /bin/bash -c "top"

  docker run -p 9030:9030 -p 8030:8030 -p 8040:8040 -itd \
--name starrocks --network tubo-database-networks \
starrocks/allin1-ubuntu


SELECT   s.sid,   s.serial#,   s.username,   s.status,   s.logon_time,  s.program, s.machine FROM v$session s WHERE s.username = 'MARMOT';                
