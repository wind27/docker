FROM centos7-jdk8-maven3:7.8.3

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY jenkins.sh ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/jenkins.sh