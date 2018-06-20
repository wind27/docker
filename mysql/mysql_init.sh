# 获取数据库密码
prefix='A temporary password is generated for root@localhost: '
pwd_default=`grep  "$prefix"  /var/log/mysqld.log | awk  -F "$prefix" '{print  $2}'`
echo $pwd_default

echo "update password and grant privileges ..."
mysql -uroot -p"$pwd_default" -e "SET PASSWORD = PASSWORD('123456')"  --connect-expired-password;
#mysql -uroot -p"$pwd_default" -e "set global validate_password_policy=0;set global validate_password_length=1;" -b --connect-expired-password
#mysql -uroot -p"$pwd_default" -e "use mysql;update user set authentication_string=password('123456') WHERE user='root';flush privileges;"
mysql -uroot -p"123456" -e "use mysql;grant all privileges on *.* to 'root'@'%' identified by '123456';flush privileges;"
echo "update password and grant privileges finish"

echo "init database tables ..."
mysql -uroot -p"123456" -e "source /opt/install/wind_auth.sql"
mysql -uroot -p"123456" -e "source /opt/install/wind_user.sql"
echo "init database tables finish"