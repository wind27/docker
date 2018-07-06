#!/bin/bash

yum install zip unzip

if [ ! -d "/opt/install/apollo" ];then
	echo "git clone apollo ..."
	cd /opt/install/
	git clone https://github.com/ctripcorp/apollo.git
	echo "git clone apollo finish"
fi

sed -i "s/localhost:3306/mysql:3306/g" `grep "localhost:3306" -rl /opt/install/apollo/scripts/build.sh`
sed -i "s/apollo_config_db_password=/apollo_config_db_password=123456/g" `grep "apollo_config_db_password=" -rl /opt/install/apollo/scripts/build.sh`
sed -i "s/apollo_portal_db_password=/apollo_portal_db_password=123456/g" `grep "apollo_portal_db_password=" -rl /opt/install/apollo/scripts/build.sh`
sh /opt/install/apollo/scripts/build.sh
echo "apollo build finish"




# start apollo configservice
mkdir -p /opt/server/apollo-configservice
if [ ! -d "/opt/server/apollo-configservice" ];then
	unzip /opt/install/apollo/apollo-configservice/target/apollo-configservice-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-configservice	
fi
#sed -i "s/SERVER_PORT=8080/SERVER_PORT=8080/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-configservice/scripts/startup.sh`
sed -i "s/LOG_DIR=\/opt\/logs\/100003171/LOG_DIR=\/opt\/logs\/apollo-configservice/g" `grep "LOG_DIR=/opt/logs/100003171" -rl /opt/server/apollo-configservice/scripts/startup.sh`
sh /opt/server/apollo-configservice/scripts/startup.sh
echo "apollo configservice start !!!"


# start apollo adminservice
mkdir -p /opt/server/apollo-adminservice
if [ ! -d "/opt/server/apollo-adminservice" ];then
	unzip /opt/install/apollo/apollo-adminservice/target/apollo-adminservice-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-adminservice
fi
#sed -i "s/SERVER_PORT=8080/SERVER_PORT=8080/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-configservice/scripts/startup.sh`
sed -i "s/LOG_DIR=\/opt\/logs\/100003172/LOG_DIR=\/opt\/logs\/apollo-adminservice/g" `grep "LOG_DIR=/opt/logs/100003172" -rl /opt/server/apollo-adminservice/scripts/startup.sh`
sh /opt/server/apollo-adminservice/scripts/startup.sh
echo "apollo adminservice start !!!"



# start apollo portal
mkdir -p /opt/server/apollo-portal
if [ ! -d "/opt/server/apollo-portal" ];then
	unzip /opt/install/apollo/apollo-portal/target/apollo-portal-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-portal
fi
sed -i "s/SERVER_PORT=8080/SERVER_PORT=8070/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-portal/scripts/startup.sh`
sed -i "s/LOG_DIR=\/opt\/logs\/100003173/LOG_DIR=\/opt\/logs\/apollo-portal/g" `grep "LOG_DIR=/opt/logs/100003173" -rl /opt/server/apollo-portal/scripts/startup.sh`
sh /opt/server/apollo-portal/scripts/startup.sh
echo "apollo portal start !!!"