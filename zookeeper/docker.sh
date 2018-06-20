#!/bin/bash

docker rm -f zookeeper
docker rmi zookeeper:3.4.12
docker build -t zookeeper:3.4.12 -f zookeeper.dockerfile .
docker run --privileged -t -d -p 2181:2181 -v /opt/data/zookeeper/:/opt/data/ -v /opt/logs/zookeeper/:/opt/logs/ --name zookeeper zookeeper:3.4.12 /usr/sbin/init;
docker network connect wind_net zookeeper
# docker exec -it zookeeper /bin/bash