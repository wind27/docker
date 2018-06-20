FROM centos:7

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR  /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}
COPY wind_auth.sql ${BASE_INSTALL_DIR}
COPY wind_user.sql ${BASE_INSTALL_DIR}
COPY mysql.sh ${BASE_INSTALL_DIR}
COPY mysql_init.sh ${BASE_INSTALL_DIR}
COPY my.cnf ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/mysql_install.sh