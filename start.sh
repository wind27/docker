#!/bin/bash

function stop() {
	docker stop mysql
	docker stop hbase
	docker stop zookeeper
	docker stop jenkins
	docker stop apollo
	echo "docker container stop finish !!!"
}

function start() {
	docker start mysql
	docker start hbase
	docker start zookeeper
	docker start jenkins
	docker start apollo
	echo "docker container start finish !!!"
}
stop
start