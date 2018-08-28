docker rm -f wind-eureka
docker rmi wind-eureka:0.0.1
docker build -t wind-eureka:0.0.1 -f wind-eureka.dockerfile .
docker run --privileged -t -d -p 8761:8761 --name wind-eureka wind-eureka:0.0.1 /usr/sbin/init;
docker network connect wind_net wind-eureka

# docker exec -it wind-eureka /bin/bash