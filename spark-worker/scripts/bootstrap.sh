#!/bin/bash

/spark/sbin/start-slave.sh $SPARK_MASTER

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

bash