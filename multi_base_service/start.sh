#!/bin/bash

# sh mysql.sh
systemctl restart mysqld

# sh zookeeper.sh
zkServer.sh restart

# sh nexus.sh
/usr/local/nexus/nexus-3.2.0-01/bin/nexus restart

# sh apollo.sh
/opt/install/apollo-build-scripts/demo.sh  restart