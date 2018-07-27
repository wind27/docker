#!/bin/bash

function start() {
	docker start nexus
	docker start mysql
	docker start hbase
	docker start zookeeper
	docker start jenkins
	docker start apollo
	echo "docker container start finish !!!"
}
start
