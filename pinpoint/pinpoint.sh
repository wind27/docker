#!/bin/bash

echo "clone pinpoint ..."
cd /opt/install/
# git clone https://github.com/naver/pinpoint.git
tar -zxvf pinpoint.tar.gz
echo "clone pinpoint finish"

cd pinpoint
mvn install -Dmaven.test.skip=true
#sh mvnw install -Prelease -Dmaven.test.skip=true