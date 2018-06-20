docker rm -f pinpoint
docker rmi pinpoint:1.0.0
docker build -t pinpoint:1.0.0 -f pinpoint.dockerfile .
docker run --privileged -t -d -p 9000:8080 --name pinpoint pinpoint:1.0.0 /usr/sbin/init;
docker network connect wind_net pinpoint

# docker exec -it pinpoint /bin/bash