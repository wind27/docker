#!/bin/bash

# install
function apollo_configservice_install() {
	if [ ! -d "/opt/server/apollo-configservice" ];then
		mkdir -p /opt/server/apollo-configservice
		rm -rf /opt/server/apollo-configservice/*
		unzip /opt/install/apollo/apollo-configservice/target/apollo-configservice-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-configservice
	fi
	#sed -i "s/SERVER_PORT=8080/SERVER_PORT=8080/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-configservice/scripts/startup.sh`
	sed -i "s/LOG_DIR=\/opt\/logs\/100003171/LOG_DIR=\/opt\/logs\/apollo-configservice/g" `grep "LOG_DIR=/opt/logs/100003171" -rl /opt/server/apollo-configservice/scripts/startup.sh`
	sh /opt/server/apollo-configservice/scripts/startup.sh
	echo "apollo configservice start !!!"
}

# chkconfig 设置开机启动
function apollo_configservice_chkconfig() {
	rm -rf /etc/rc.d/init.d/apollo_configservice
	touch /etc/rc.d/init.d/apollo_configservice
	chmod +x /etc/rc.d/init.d/apollo_configservice
	echo '#!/bin/bash' >> /etc/rc.d/init.d/apollo_configservice
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/apollo_configservice
	echo 'sh /opt/server/apollo-configservice/scripts/startup.sh' >> /etc/rc.d/init.d/apollo_configservice
	chkconfig --add apollo_configservice
	echo "chkconfig add apollo_configservice success"
}

apollo_configservice_install
apollo_configservice_chkconfig