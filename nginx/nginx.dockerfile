FROM centos7

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY nginx.sh ${BASE_INSTALL_DIR}

COPY start.sh ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/nginx.sh





FROM nginx:1.7
  
MAINTAINER qianchun, qinachun@huli.com

COPY default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]