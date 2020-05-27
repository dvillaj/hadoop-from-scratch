#!/bin/bash
rm /tmp/*.pid

service ssh start

# init hive metastorage
$HIVE_HOME/bin/schematool -dbType derby -initSchema

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse


if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

bash