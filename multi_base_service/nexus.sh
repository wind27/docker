#!/bin/bash

echo "install nexus-2.11.2-03-bundle ..."
mkdir -p /usr/local/nexus
rm -rf /usr/local/nexus/*
cd /opt/install/
rm -rf nexus-3.2.0-01-unix.tar.gz
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.2.0-01-unix.tar.gz
tar -zxvf nexus-3.2.0-01-unix.tar.gz -C /usr/local/nexus
echo "install nexus-2.11.2-03-bundle finish"

echo "init PATH ..."
echo 'export NEXUS_HOME=/usr/local/nexus/nexus-3.2.0-01' >> /etc/profile
echo 'export PATH=$PATH:$NEXUS_HOME/bin' >> /etc/profile 
sleep 1
`source /etc/profile`
sleep 1
echo "init PATH finish"

echo "start nexus ..."
/usr/local/nexus/nexus-3.2.0-01/bin/nexus start
echo "start nexus finish"

