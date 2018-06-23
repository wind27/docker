FROM centos-jdk-maven:7.8.3
MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY settings.xml ${BASE_INSTALL_DIR}
COPY my.cnf ${BASE_INSTALL_DIR}
COPY zoo.cfg ${BASE_INSTALL_DIR}

COPY wind_auth.sql ${BASE_INSTALL_DIR}
COPY wind_user.sql ${BASE_INSTALL_DIR}
COPY apolloconfigdb.sql ${BASE_INSTALL_DIR}
COPY apolloportaldb.sql ${BASE_INSTALL_DIR}

COPY init.sh ${BASE_INSTALL_DIR}
COPY jdk.sh ${BASE_INSTALL_DIR}
COPY maven.sh ${BASE_INSTALL_DIR}
COPY zookeeper.sh ${BASE_INSTALL_DIR}
COPY nexus.sh ${BASE_INSTALL_DIR}
COPY jenkins.sh ${BASE_INSTALL_DIR}
COPY mysql.sh ${BASE_INSTALL_DIR}
COPY apollo.sh ${BASE_INSTALL_DIR}