FROM centos-jdk-maven:7.8.3

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY rabbitmq-erlang.repo ${BASE_INSTALL_DIR}
COPY rabbitmq-env.conf ${BASE_INSTALL_DIR}
COPY rabbitmq.config ${BASE_INSTALL_DIR}

COPY user.sh ${BASE_INSTALL_DIR}
COPY rabbitmq.sh ${BASE_INSTALL_DIR}
COPY install.sh ${BASE_INSTALL_DIR}
COPY restart.sh ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/install.sh