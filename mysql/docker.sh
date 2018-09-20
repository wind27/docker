docker rm -f mysql
docker rmi mysql:5.7.22
docker build -t mysql:5.7.22 -f mysql.dockerfile .
docker run --privileged -t -d -p 3306:3306 -v /opt/data/mysql/:/opt/mysql/ --name mysql mysql:5.7.22 /usr/sbin/init;
docker network connect wind_net mysql
# docker exec -it mysql /bin/bash