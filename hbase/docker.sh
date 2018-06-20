docker rm -f hbase
docker rmi hbase:2.0.0
docker build -t hbase:2.0.0 -f hbase.dockerfile .
docker run --privileged -t -d -p 16010:16010 --name hbase hbase:2.0.0 /usr/sbin/init;
docker network connect wind_net hbase

# docker exec -it hbase /bin/bash