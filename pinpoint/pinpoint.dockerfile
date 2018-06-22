FROM centos-jdk-maven:7.8.3

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY install.sh ${BASE_INSTALL_DIR}
COPY hbase.sh ${BASE_INSTALL_DIR}
COPY pinpoint.sh ${BASE_INSTALL_DIR}

COPY hbase-site.xml ${BASE_INSTALL_DIR}
COPY zoo.cfg ${BASE_INSTALL_DIR}

RUN sh /opt/install/install.sh