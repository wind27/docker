#!/bin/bash

# download 
function jenkins_download() {
	jenkins_md5='e440c41a705f1b4688f0767f8d0a122c';
	flag = 1;
	while [ flag == 1 ]; do
		if [ ! -f "/opt/install/mysql57-community-release-el7-7.noarch.rpm" ];then
			wget -P /opt/install/ https://pkg.jenkins.io/redhat-stable/jenkins-2.107.3-1.1.noarch.rpm
		fi
		md5=`md5sum /opt/install/jenkins-2.107.3-1.1.noarch.rpm | awk -F ' ' '{print $1}'`
		if [ $md5 == $mysql_md5 ]; then
			flag = 0;
		else
			rm -rf /opt/install/jenkins-2.107.3-1.1.noarch.rpm
		fi
	done
	echo "jenkins install finish !!!"
}

# install
function jenkins_install() {
	jenkins_is_install=`rpm -qa | grep jenkins |wc -l`
	if [ $jenkins_is_install == 0 ];then
		rpm -ivh /opt/install/jenkins-2.107.3-1.1.noarch.rpm
	fi
	echo "jenkins install success !!!"
}

# chkconfig
function jenkins_chkconfig() {
	cd /etc/rc.d/init.d/
	rm -rf /etc/rc.d/init.d/jenkins 
	touch /etc/rc.d/init.d/jenkins
	chmod +x /etc/rc.d/init.d/jenkins
	echo '#!/bin/bash' >> /etc/rc.d/init.d/jenkins
	echo '# chkconfig: 12345 95 05' >> /etc/rc.d/init.d/jenkins
	echo 'nohup java -jar /usr/lib/jenkins/jenkins.war --ajp13Port=-1 --httpPort=8082 &' >> /etc/rc.d/init.d/jenkins
	chkconfig --add jenkins
	echo "chkconfig add jenkins success"
}

# start jenkins
function jenkins_start() {
	nohup java -jar /usr/lib/jenkins/jenkins.war --ajp13Port=-1 --httpPort=8082 &  
	echo "start jenkins success !!!"
}


jenkins_download
jenkins_install
jenkins_start
jenkins_chkconfig