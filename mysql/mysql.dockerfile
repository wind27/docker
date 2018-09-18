FROM centos:7

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR  /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY my.cnf ${BASE_INSTALL_DIR}
COPY wind_auth.sql ${BASE_INSTALL_DIR}
COPY wind_user.sql ${BASE_INSTALL_DIR}
COPY wind_blog.sql ${BASE_INSTALL_DIR}
COPY apolloportaldb.sql ${BASE_INSTALL_DIR}
COPY apolloconfigdb.sql ${BASE_INSTALL_DIR}

COPY start.sh ${BASE_INSTALL_DIR}
COPY mysql.sh ${BASE_INSTALL_DIR}
COPY mysql.sh.bak ${BASE_INSTALL_DIR}
COPY install.sh ${BASE_INSTALL_DIR}

#RUN sh ${BASE_INSTALL_DIR}/install.sh