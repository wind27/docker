#!/bin/bash

echo "stop apollo ..."
/opt/install/apollo-build-scripts/demo.sh stop
echo "stop apollo finish"

echo "start apollo ..."
/opt/install/apollo-build-scripts/demo.sh start
echo "start apollo finish"