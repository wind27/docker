#!/bin/bash

# install
function apollo_adminservice_install() {
	if [ ! -d "/opt/server/apollo-adminservice" ];then
		mkdir -p /opt/server/apollo-adminservice
		rm -rf /opt/server/apollo-adminservice/*
		unzip /opt/install/apollo/apollo-adminservice/target/apollo-adminservice-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-adminservice
	fi
	#sed -i "s/SERVER_PORT=8080/SERVER_PORT=8080/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-configservice/scripts/startup.sh`
	sed -i "s/LOG_DIR=\/opt\/logs\/100003172/LOG_DIR=\/opt\/logs\/apollo-adminservice/g" `grep "LOG_DIR=/opt/logs/100003172" -rl /opt/server/apollo-adminservice/scripts/startup.sh`
	sh /opt/server/apollo-adminservice/scripts/startup.sh
	echo "apollo adminservice start !!!"
}

# chkconfig 设置开机启动
function apollo_adminservice_chkconfig() {
	rm -rf /etc/rc.d/init.d/apollo_adminservice
	touch /etc/rc.d/init.d/apollo_adminservice
	chmod +x /etc/rc.d/init.d/apollo_adminservice
	echo '#!/bin/bash' >> /etc/rc.d/init.d/apollo_adminservice
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/apollo_adminservice
	echo 'sh /opt/server/apollo-adminservice/scripts/startup.sh' >> /etc/rc.d/init.d/apollo_adminservice
	chkconfig --add apollo_adminservice
	echo "chkconfig add apollo_adminservice success"
}

apollo_adminservice_install
apollo_adminservice_chkconfig