#!/bin/bash

# download mysql yum repo and install mysql
echo "install mysql ..."
cd /opt/install
rm -f mysql57-community-release-el7-7.noarch.rpm;
wget dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm;
rpm -ivh mysql57-community-release-el7-7.noarch.rpm;
yum -y install mysql-community-server
echo "install mysql finish !!!"

# start mysql
echo "start mysql ..."
mysqld --initialize
chmod -R 777 /var/lib/mysql/*
#cp /opt/install/my.cnf /etc/my.cnf
systemctl start mysqld
sleep 1
echo "start mysql finish"

echo "init mysql ..."
#sh /opt/install/mysql_init.sh
# 获取数据库密码
prefix='A temporary password is generated for root@localhost: '
pwd_default=`grep  "$prefix"  /var/log/mysqld.log | awk  -F "$prefix" '{print  $2}'`
echo $pwd_default

echo "update password and grant privileges ..."

mysql -uroot -p"$pwd_default" -e "SET PASSWORD = PASSWORD('123456')"  --connect-expired-password;

mysql -uroot -p"123456" -e "use mysql;grant all privileges on *.* to 'root'@'%' identified by '123456';flush privileges;"
echo "update password and grant privileges finish"

echo "init database tables ..."
mysql -uroot -p"123456" -e "source /opt/install/wind_auth.sql"
mysql -uroot -p"123456" -e "source /opt/install/wind_user.sql"

mysql -uroot -p"123456" -e "source /opt/install/apolloconfigdb.sql"
mysql -uroot -p"123456" -e "source /opt/install/apolloportaldb.sql"

echo "init database tables finish"