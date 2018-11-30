#!/bin/bash

docker rm -f rabbitmq
docker rmi rabbitmq:3.7.7
docker build -t rabbitmq:3.7.7 -f rabbitmq.dockerfile .
docker run --privileged -t -d -p 15672:15672 -p 5672:5672 -v /opt/data/rabbitmq:/opt/rabbitmq/  --name rabbitmq rabbitmq:3.7.7 /usr/sbin/init
docker network connect wind_net rabbitmq
# docker exec -it rabbitmq /bin/bash