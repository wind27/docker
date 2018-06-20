#!/bin/bash


cd /opt/install/
git clone https://github.com/naver/pinpoint.git
cd pinpoint
mvn install -Dmaven.test.skip=true