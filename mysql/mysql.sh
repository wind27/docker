#!/bin/bash

downloan_url='http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm'
downloan_file_name='mysql57-community-release-el7-7.noarch.rpm'
mysql_md5='5e4b5cdc76c6d9637cdf2d0214a1faba';
password='Dev123@wind.COM';

# init
function _init() {
	mkdir -p /opt/mysql/data/ /opt/mysql/log/
	rm -rf /opt/mysql/data/* /opt/mysql/log/*
	chown -R mysql.mysql /opt/mysql
}

# download 
function _download() {
	wget -P /opt/install/ ${downloan_url}
	md5=`md5sum /opt/install/${downloan_file_name} | awk -F ' ' '{print $1}'`
	if [ $md5 != $mysql_md5 ]; then
		echo "mysql download fail !!!"
		exit -1
	fi
	echo "mysql download finish !!!"
}

# install
function _install() {
	mysql_is_install=`rpm -qa | grep mysql |wc -l`
	if [ ${mysql_is_install} == 0 ];then
		rpm -ivh /opt/install/mysql57-community-release-el7-7.noarch.rpm;
		yum -y install mysql-community-server
	fi
	echo "mysql install success !!!"
}

# config
function _start() {
	# start mysql
	echo "start mysql ..."
	mysqld --initialize
	chmod -R 777 /var/lib/mysql/*
	chown -R mysql.mysql /opt/mysql

	mv /etc/my.cnf /etc/my.cnf.bak
	cp /opt/install/my.cnf /etc/my.cnf
	systemctl start mysqld
	sleep 1
	echo "start mysql finish"	
}

# change pwd
function _changePwd() {
	# 获取数据库密码
	prefix='A temporary password is generated for root@localhost: '
	pwd_default=`grep  "$prefix"  /opt/mysql/log/mysqld.log | awk  -F "$prefix" '{print  $2}'`
	echo $pwd_default
	echo "update password and grant privileges ..."
	mysql -uroot -p"$pwd_default" -e "SET PASSWORD = PASSWORD(${password})"  --connect-expired-password;
	mysql -uroot -p"${password}" -e "use mysql;grant all privileges on *.* to 'root'@'%' identified by '${password}';flush privileges;"
	echo "update password and grant privileges finish"
}

# init database
function _initdb() {
	echo "init database tables ..."
	mysql -uroot -p"${password}" -e "source /opt/install/wind_auth.sql"
	mysql -uroot -p"${password}" -e "source /opt/install/wind_user.sql"
	mysql -uroot -p"${password}" -e "source /opt/install/wind_blog.sql"
}

# chkconfig 设置开机启动
function _chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/mysql 
	touch /etc/rc.d/init.d/mysql
	chmod +x /etc/rc.d/init.d/mysql
	echo "#!/bin/bash" >> /etc/rc.d/init.d/mysql
	echo "# chkconfig: 12345 95 05" >> /etc/rc.d/init.d/mysql
	echo "systemctl start mysqld" >> /etc/rc.d/init.d/mysql
	chkconfig --add mysql
	echo "chkconfig add mysql success"
}

_init
_download
_install
_start
_changePwd
_initdb
_chkconfig