#!/bin/bash

echo "git clone apollo ..."
cd /opt/install/
rm -rf apollo-build-scripts
git clone https://github.com/nobodyiam/apollo-build-scripts.git
echo "git clone apollo finish"

echo "update apollo config ..."
cd apollo-build-scripts/
sed -i "s/apollo_config_db_password=/apollo_config_db_password=123456/g" `grep "apollo_config_db_password=" -rl demo.sh`
sed -i "s/apollo_portal_db_password=/apollo_portal_db_password=123456/g" `grep "apollo_portal_db_password=" -rl demo.sh`
sed -i "s/declare -i max_counter=24/declare -i max_counter=120/g" `grep "apollo_portal_db_password=" -rl demo.sh`
echo "update apollo config finish"

#echo "start apollo ..."
#./demo.sh start
#echo "start apollo finish"