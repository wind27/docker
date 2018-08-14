#!/bin/bash

BIN_PATH=`pwd`
cd ../
DEPLOY_PATH=`pwd`
CONF_PATH=$DEPLOY_PATH/conf
CONF_DIR=$CONF_PATH:$CONF_PATH/spring:$CONF_PATH/META-INF
LIB_DIR=$DEPLOY_PATH/lib
LIB_JAR=`ls $LIB_DIR | grep ".jar" | awk '{print "$LIB_DIR/"$0}'|tr "\n" ":"`
echo "lib jar : $LIB_JAR"
echo "conf dir : $CONF_DIR"
java -Ddev=DEV -Ddev_meta=http://apollo:8080 -classpath $CONF_DIR:$LIB_JAR com.wind.auth.Application