#!/bin/bash

# install
function apollo_portal_install() {
	if [ ! -d "/opt/server/apollo-portal" ];then
		mkdir -p /opt/server/apollo-portal
		rm -rf /opt/server/apollo-portal/*
		unzip /opt/install/apollo/apollo-portal/target/apollo-portal-0.11.0-SNAPSHOT-github.zip -d /opt/server/apollo-portal
	fi
	sed -i "s/SERVER_PORT=8080/SERVER_PORT=8070/g" `grep "SERVER_PORT=8080" -rl /opt/server/apollo-portal/scripts/startup.sh`
	sed -i "s/LOG_DIR=\/opt\/logs\/100003173/LOG_DIR=\/opt\/logs\/apollo-portal/g" `grep "LOG_DIR=/opt/logs/100003173" -rl /opt/server/apollo-portal/scripts/startup.sh`
	sh /opt/server/apollo-portal/scripts/startup.sh
	echo "apollo portal start !!!"
}

# chkconfig 设置开机启动
function apollo_port_chkconfig() {
	rm -rf /etc/rc.d/init.d/apollo_portal
	touch /etc/rc.d/init.d/apollo_portal
	chmod +x /etc/rc.d/init.d/apollo_portal
	echo '#!/bin/bash' >> /etc/rc.d/init.d/apollo_portal
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/apollo_portal
	echo 'sh /opt/server/apollo-portal/scripts/startup.sh' >> /etc/rc.d/init.d/apollo_portal
	chkconfig --add apollo_portal
	echo "chkconfig add apollo_portal success"
}

apollo_portal_install
apollo_port_chkconfig