#!/bin/bash

# 安装
echo "install nginx-1.13.12 ..."
cd /opt/install/
rm -rf nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
wget http://nginx.org/packages/mainline/centos/7/x86_64/RPMS/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
rpm -ivh nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
rm -rf nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
echo "install nginx-1.13.12 finish"




#!/bin/bash
set -e
sed -i "s|{{NGINX_HOST}}|$NGINX_HOST|" /etc/nginx/conf.d/default.conf
sed -i "s|{{NGINX_PROXY}}|$NGINX_PROXY|" /etc/nginx/conf.d/default.conf
sed -i "s|{{NGINX_WIND_AUTH_SERVICE_HOST}}|$NGINX_WIND_AUTH_SERVICE_HOST|;" /etc/nginx/conf.d/default.conf
sed -i "s|{{NGINX_WIND_AUTH_SERVICE_PROXY}}|$NGINX_WIND_AUTH_SERVICE_PROXY|" /etc/nginx/conf.d/default.conf
sed -i "s|{{NGINX_WIND_AUTH_WEB_HOST}}|$NGINX_WIND_AUTH_WEB_HOST|" /etc/nginx/conf.d/default.conf
sed -i "s|{{NGINX_WIND_AUTH_WEB_PROXY}}|$NGINX_WIND_AUTH_WEB_PROXY|" /etc/nginx/conf.d/default.conf





 NGINX_HOST=current.wind.com
      - NGINX_WIND_AUTH_SERVICE_PROXY=http://wind-auth-service:80
      - NGINX_WIND_AUTH_WEB_PROXY=http://wind-auth-web:80