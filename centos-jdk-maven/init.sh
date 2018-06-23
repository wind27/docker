echo "update root password ..."
echo "123456" | passwd root --stdin > /dev/null 2>&1
echo "update root password finish"

# install tools
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients..."
yum -y install wget telnet  vim git net-tools lsof openssh-server openssh-clients;
yum -y groupinstall "fonts"
echo "install tools wget telnet vim git net-tools lsof openssh-server openssh-clients finish !!!"