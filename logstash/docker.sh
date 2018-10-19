#!/bin/bash

docker rm -f logstash
docker rmi logstash:6.4.0
docker build -t logstash:6.4.0 -f logstash.dockerfile .

docker run --privileged -t -d -v /opt/data/logstash:/opt/logstash/ --name logstash logstash:6.4.0 /usr/sbin/init;
docker network connect wind_net logstash
# docker exec -it logstash /bin/bash