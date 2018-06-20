docker rm -f base_server
docker rmi base_server:1.0.0
docker build -t base_server:1.0.0 -f base_server.dockerfile .
docker run --privileged -t -d -p 8082:8082 -p 3306:3306 -p 8081:8081 -p 2181:2181 -p 9001:8080 -p 8070:8070 -p 8090:8090 --name base_server base_server:1.0.0 /usr/sbin/init;
docker network connect wind_net base_server
# docker exec -it base_server /bin/bash



ID=$(docker run -d redis touch /new-file)


# spring.datasource.url = jdbc:mysql://base_server:3306/wind_auth?useUnicode=true&characterEncoding=utf8
# spring.datasource.username = root
# spring.datasource.password = 123456
# spring.datasource.driver-class-name = com.mysql.jdbc.Driver

# dubbo.application.name = wind-user-service
# dubbo.registry.address = zookeeper://base_server:2181
# dubbo.protocol = dubbo
# dubbo.protocol.port = 2181
# dubbo.user.version = 2.0.0
# dubbo.timeout = 5000
# dubbo.retries = 3
