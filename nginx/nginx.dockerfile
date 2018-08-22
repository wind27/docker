FROM centos:7

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY nginx.sh ${BASE_INSTALL_DIR}
COPY install.sh ${BASE_INSTALL_DIR}
COPY restart.sh ${BASE_INSTALL_DIR}

COPY nginx.conf ${BASE_INSTALL_DIR}
COPY wind_admin.conf ${BASE_INSTALL_DIR}
COPY wind_base.conf ${BASE_INSTALL_DIR}
COPY upstream_admin.conf ${BASE_INSTALL_DIR}
COPY upstream_base.conf ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/install.sh