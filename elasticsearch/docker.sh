#!/bin/bash

docker rm -f elasticsearch
docker rmi elasticsearch:6.4.0
docker build -t elasticsearch:6.4.0 -f elasticsearch.dockerfile .

docker run --privileged -t -d -p 9200:9200 -p 9300:9300 -v /opt/data/elasticsearch:/opt/elasticsearch/ --name elasticsearch elasticsearch:6.4.0 /usr/sbin/init;
docker network connect wind_net elasticsearch
# docker exec -it elasticsearch /bin/bash