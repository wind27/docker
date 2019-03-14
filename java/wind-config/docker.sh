docker rm -f wind-config
docker rmi wind-config:0.0.1
docker build -t wind-config:0.0.1 -f wind-config.dockerfile .
docker run --privileged -t -d -p 8077:8077 --name wind-config wind-config:0.0.1 /usr/sbin/init;
docker network connect wind_net wind-config

# docker exec -it wind-config /bin/bash