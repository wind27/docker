docker rm -f centos_jdk_maven
docker rmi centos-jdk-maven:7.8.3
docker build -t centos-jdk-maven:7.8.3 -f centos_jdk_maven.dockerfile .
docker run --privileged -t -d --name centos_jdk_maven centos-jdk-maven:7.8.3 /usr/sbin/init;
docker exec -it centos_jdk_maven /bin/bash