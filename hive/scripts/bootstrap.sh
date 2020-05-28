#!/bin/bash
rm /tmp/*.pid

service ssh start

# init hive metastorage
wait-for-it.sh mysql:3306 -t 100 -- $HIVE_HOME/bin/schematool -dbType mysql -initSchema

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse

mkdir -p /usr/local/hive/logs
hive --service hiveserver2  > /usr/local/hive/logs/hive2.log 2>&1 &
hive --service metastore  > /usr/local/hive/logs/metastore.log 2>&1 &

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi



bash