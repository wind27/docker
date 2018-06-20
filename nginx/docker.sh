#!/bin/bash

docker rm -f nginx:
docker rmi nginx:1.13.12
docker build -t nginx:1.13.12 -f nginx.dockerfile .
docker run --privileged -t -d -p 6666:80 --name nginx nginx:1.13.12 /usr/sbin/init;
docker network connect wind_net nginx
# docker exec -it nginx /bin/bash