#!/bin/sh

NAME=grafana
CONTAINER=$NAME
HOST=$NAME
IMAGE=$NAME
PORT=3000
DB_CONTAINER=influxdb
DOCKER_HUB_IMG=caquicode/$NAME

docker stop $CONTAINER
docker rm $CONTAINER

ENV="-e GF_SECURITY_ADMIN_PASSWORD=password -e GF_SECURITY_ADMIN_USER=root"
docker run -d -h $HOST --name $CONTAINER --link $DB_CONTAINER:$DB_CONTAINER -p $PORT:$PORT $ENV $DOCKER_HUB_IMG
docker logs -f $CONTAINER