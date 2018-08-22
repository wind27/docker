#!/bin/bash

# download 
function _download() {
	nginx_rpm_md5='437f9fd29c8965fa0e71f20203ed973d';
	#flag=1;
	#while [ flag == 1 ]; do
		if [ ! -f "/opt/install/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm" ];then
			wget -P /opt/install/ http://nginx.org/packages/mainline/centos/7/x86_64/RPMS/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
		fi
		md5=`md5sum /opt/install/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm | awk -F ' ' '{print $1}'`
		if [ $md5 == $nginx_rpm_md5 ]; then
			flag = 0;
		else
			rm -rf /opt/install/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
			echo "download nginx fail, please try again !!!"
			exit -1
		fi
	#done
	echo "nginx install finish !!!"
}

# install
function _install() {
	nginx_is_install=`rpm -qa | grep nginx |wc -l`
	if [ $nginx_is_install == 0 ];then
		rpm -ivh /opt/install/nginx-1.13.12-1.el7_4.ngx.x86_64.rpm
	fi

	mkdir -p /opt/logs/nginx/ /opt/pid/
	touch /opt/logs/nginx/error.log /opt/logs/nginx/access.log /opt/pid/nginx.pid
	cp /opt/install/nginx.conf /etc/nginx/nginx.conf
	cp /opt/install/wind_admin.conf /etc/nginx/conf.d/wind_admin.conf
	cp /opt/install/wind_base.conf /etc/nginx/conf.d/wind_base.conf
	cp /opt/install/upstream_admin.conf /etc/nginx/conf.d/upstream_admin.conf
	cp /opt/install/upstream_base.conf /etc/nginx/conf.d/upstream_base.conf
	echo 'nginx install success !!!'
}

# start
function _start() {
	/usr/sbin/nginx
	echo "start nginx success !!!"
}

# chkconfig
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/nginx 
	touch /etc/rc.d/init.d/nginx
	chmod +x /etc/rc.d/init.d/nginx
	echo '#!/bin/bash' >> /etc/rc.d/init.d/nginx
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/nginx
	echo '/usr/sbin/nginx' >> /etc/rc.d/init.d/nginx
	chkconfig --add nginx
	echo "chkconfig add nginx success"
}

_download
_install
_start
_chkconfig