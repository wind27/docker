docker rm -f wind-rabbitmq
docker rmi wind-rabbitmq:0.0.1
docker build -t wind-rabbitmq:0.0.1 -f wind-rabbitmq.dockerfile .
docker run --privileged -t -d --name wind-rabbitmq wind-rabbitmq:0.0.1 /usr/sbin/init;
docker network connect wind_net wind-rabbitmq

# docker exec -it wind-rabbitmq /bin/bash