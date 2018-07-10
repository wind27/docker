#!/bin/bash

docker rm -f apollo
docker rmi apollo
docker build -t apollo -f apollo.dockerfile .
docker run --privileged -t -d -p 8070:8070 -p 8080:8080 -p 8090:8090 --name apollo apollo /usr/sbin/init;
docker network connect wind_net apollo
# docker exec -it apollo /bin/bash