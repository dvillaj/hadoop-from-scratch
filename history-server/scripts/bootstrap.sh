#!/bin/bash


service ssh start

$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_HOME/etc/hadoop

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

bash