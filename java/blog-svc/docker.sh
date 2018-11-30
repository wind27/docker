docker rm -f blog-svc
docker rmi blog-svc:0.0.1
docker build -t blog-svc:0.0.1 -f blog-svc.dockerfile .
docker run --privileged -t -d --name blog-svc blog-svc:0.0.1 /usr/sbin/init;
docker network connect wind_net blog-svc

# docker exec -it wind-blog /bin/bash