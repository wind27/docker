#!/bin/bash

# download 
function nexus_download() {
	nexus_md5='727287d2f6e697a28f4501b42ab7db71';
	#flag=1;
	#while [ flag == 1 ]; do
		if [ ! -f "/opt/install/nexus-3.2.0-01-unix.tar.gz" ];then
			wget -P /opt/install/ https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.2.0-01-unix.tar.gz
		fi
		md5=`md5sum /opt/install/nexus-3.2.0-01-unix.tar.gz | awk -F ' ' '{print $1}'`
		if [ $md5 == $nexus_md5 ]; then
			flag = 0;
		else
			rm -rf /opt/install/nexus-3.2.0-01-unix.tar.gz
		fi
	#done
	echo "nexus download finish !!!"
}

function nexus_install() {
	if [ ! -d /usr/local/nexus/nexus-3.2.0-01/ ]; then
		rm -rf /usr/local/nexus/*
		mkdir -p /usr/local/nexus
		tar -zxvf /opt/install/nexus-3.2.0-01-unix.tar.gz -C /usr/local/nexus
	fi
	/usr/local/nexus/nexus-3.2.0-01/bin/nexus restart
	echo "nexus install success !!!"
}

# chkconfig
function nexus_chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/nexus 
	touch /etc/rc.d/init.d/nexus
	chmod +x /etc/rc.d/init.d/nexus
	echo '#!/bin/bash' >> /etc/rc.d/init.d/nexus
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/nexus
	echo '/usr/local/nexus/nexus-3.2.0-01/bin/nexus start' >> /etc/rc.d/init.d/nexus
	chkconfig --add nexus
	echo "chkconfig add nexus success"
}

nexus_download
nexus_install
nexus_chkconfig
