docker rm -f jenkins
docker rmi jenkins:2.107
docker build -t jenkins:2.107 -f jenkins.dockerfile .
docker run --privileged -t -d -p 8082:8082 -v /opt/data/jenkins:/opt/jenkins/ --name jenkins jenkins:2.107 /usr/sbin/init;
docker network connect wind_net jenkins

#docker exec -it jenkins /bin/bash