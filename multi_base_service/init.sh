echo "update root password ..."
echo "123456" | passwd root --stdin > /dev/null 2>&1
echo "update root password finish"

# install tools
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients..."
yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients;
yum -y groupinstall "fonts"
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients finish !!!"

# init hosts
echo "init hosts ..."
echo '127.0.0.1        mysql' >> /etc/hosts
echo '127.0.0.1        nexus' >> /etc/hosts
echo '127.0.0.1        zookeeper' >> /etc/hosts
echo "init hosts finish"