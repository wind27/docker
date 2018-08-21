docker rm -f wind-auth-svc
docker rmi wind-auth-svc:0.0.1
docker build -t wind-auth-svc:0.0.1 -f wind-auth-svc.dockerfile .
docker run --privileged -t -d --name wind-auth-svc wind-auth-svc:0.0.1 /usr/sbin/init;
docker network connect wind_net wind-auth-svc

# docker exec -it wind-auth-service /bin/bash