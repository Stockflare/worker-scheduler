#!/bin/bash

cd $DRONE_BUILD_DIR

export DOCKER_DAEMON_ARGS="--insecure-registry $REGISTRY_ENDPOINT"

wrapdocker &

sleep 5

docker build --force-rm -t $REGISTRY_ENDPOINT/$REGISTRY_REPO:$DRONE_COMMIT .

docker push $REGISTRY_ENDPOINT/$REGISTRY_REPO:$DRONE_COMMIT

start-stop-daemon --stop --pidfile "/var/run/docker.pid"
