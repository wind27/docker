#!/bin/bash

#download_mysql()
#install_mysql()
#init_mysql()



# init mysql
function init_mysql() {
	mysqld --initialize
	chmod -R 777 /var/lib/mysql/*
	#cp /opt/install/my.cnf /etc/my.cnf
	systemctl restart mysqld
	echo "start mysql finish"

	prefix='A temporary password is generated for root@localhost: '
	pwd_default=`grep  "$prefix"  /var/log/mysqld.log | awk  -F "$prefix" '{print  $2}'`
	mysql -uroot -p"'$pwd_default'" -e "SET PASSWORD = PASSWORD('123456')"  --connect-expired-password;
	echo "update password finish"

	mysql -uroot -p"123456" -e "use mysql;grant all privileges on *.* to 'root'@'%' identified by '123456';flush privileges;"
	echo "grant privileges finish"
}

# install
function install_mysql() {
	rpm -ivh /opt/install/mysql57-community-release-el7-7.noarch.rpm;
	yum -y install mysql-community-server
}


# download
function download_mysql() {
	local flag=mysql_md5_check
	echo "check mysql md result: $flag"
	while [ $flag -e 0 ]; do	
		wget -P /opt/install/ dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
		flag=mysql_md5_check
	done
	echo "download mysql rpm finish !!!"
}


# check md5
function mysql_md5_check() {
	mysql_md5='05deb28004fb21744af4ed0ad199ce55'
	if [ ! -f "/opt/install/mysql57-community-release-el7-7.noarch.rpm" ];then
		return 0
	fi
	md5=`md5sum /opt/install/mysql57-community-release-el7-7.noarch.rpm | echo  $mysql_md5 |awk -F ' ' '{print $1}'`
	if [ $md5 == $mysql_md5 ]; then
		return 1
	else
		rm -rf /opt/install/mysql57-community-release-el7-7.noarch.rpm
    	return 0
	fi
}

echo "start"
download_mysql
install_mysql
init_mysql
