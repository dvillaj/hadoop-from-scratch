#!/bin/bash

/spark/sbin/start-master.sh

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

bash