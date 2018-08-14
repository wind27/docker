#!/bin/bash

echo "stop apollo ..."
/opt/install/apollo-build-scripts/demo.sh stop
echo "stop apollo finish"

echo "start apollo ..."
/opt/install/apollo-build-scripts/demo.sh start
echo "start apollo finish"


#nohup java -Ddev=DEV -Ddev_meta=http://apollo:8080 -jar /opt/server/wind-auth-service/lib/wind-auth-service-0.0.1-SNAPSHOT.jar &