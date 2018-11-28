docker rm -f nexus
docker rmi nexus:3.2.0
docker build -t nexus:3.2.0 -f nexus.dockerfile .
docker run --privileged -t -d -p 8081:8081 -v /opt/data/nexus:/opt/nexus/ --name nexus nexus:3.2.0 /usr/sbin/init;
docker network connect wind_net nexus
# docker exec -it nexus /bin/bash