docker rm -f wind-auth-service
docker rmi wind-auth-service:1.0.0
docker build -t wind-auth-service:1.0.0 -f wind-auth-service.dockerfile .
docker run --privileged -t -d -p 9000:8080 --name wind-auth-service wind-auth-service:1.0.0 /usr/sbin/init;
docker network connect wind_net wind-auth-service

# docker exec -it wind-auth-service /bin/bash