docker rm -f wind-blog
docker rmi wind-blog:0.0.1
docker build -t wind-blog:0.0.1 -f wind-blog.dockerfile .
docker run --privileged -t -d --name wind-blog wind-blog:0.0.1 /usr/sbin/init;
docker network connect wind_net wind-blog

# docker exec -it wind-blog /bin/bash