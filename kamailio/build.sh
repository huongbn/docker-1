#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo $COMMIT > etc/commit

docker build $BUILD_FLAGS \
	--build-arg REPO=$REPO \
	--build-arg CONFIG=ef98bf453cb81475bbf5ccbc0635749a975b093c \
	-t $NETWORK/kamailio \
	.
