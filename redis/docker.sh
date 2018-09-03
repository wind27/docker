#!/bin/bash

docker rm -f redis
docker rmi redis:3.4.12
docker build -t redis:3.4.12 -f redis.dockerfile .

docker run --privileged -t -d -p 6379:6379 --name redis redis:3.4.12 /usr/sbin/init;
docker network connect wind_net redis
# docker exec -it redis /bin/bash