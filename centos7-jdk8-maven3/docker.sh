docker rm -f centos7_jdk8_maven3
docker rmi centos7-jdk8-maven3:7.8.3
docker build -t centos7-jdk8-maven3:7.8.3 -f centos7_jdk8_maven3.dockerfile .
docker run --privileged -t -d --name centos7_jdk8_maven3 centos7-jdk8-maven3:7.8.3 /usr/sbin/init;
# docker exec -it centos7_jdk8_maven3 /bin/bash