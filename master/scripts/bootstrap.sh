#!/bin/bash
rm /tmp/*.pid

service ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

$HADOOP_HOME/bin/hadoop fs -mkdir -p /user/root
$HADOOP_HOME/bin/hadoop fs -mkdir -p /user/vagrant
$HADOOP_HOME/bin/hadoop fs -chown vagrant:vagrant /user/vagrant

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

bash