#!/bin/bash

echo "install nexus-2.11.2-03-bundle ..."
mkdir -p /usr/local/nexus
rm -rf /usr/local/nexus/*

cd /opt/install/
rm nexus-3.2.0-01-unix.tar.gz
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.2.0-01-unix.tar.gz
tar -zxvf nexus-3.2.0-01-unix.tar.gz -C /usr/local/nexus
echo "install nexus-2.11.2-03-bundle finish"