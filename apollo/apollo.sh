#!/bin/bash

function apollo_clone() {
	if [ ! -d "/opt/install/apollo" ];then
		echo "git clone apollo ..."
		cd /opt/install/
		git clone https://github.com/ctripcorp/apollo.git
		echo "git clone apollo finish"
	fi
}

function build() {
	sed -i "s/localhost:3306/mysql:3306/g" `grep "localhost:3306" -rl /opt/install/apollo/scripts/build.sh`
	sed -i "s/apollo_config_db_password=/apollo_config_db_password=123456/g" `grep "apollo_config_db_password=" -rl /opt/install/apollo/scripts/build.sh`
	sed -i "s/apollo_portal_db_password=/apollo_portal_db_password=123456/g" `grep "apollo_portal_db_password=" -rl /opt/install/apollo/scripts/build.sh`
	sh /opt/install/apollo/scripts/build.sh
	echo "apollo build finish"
}

apollo_clone
build