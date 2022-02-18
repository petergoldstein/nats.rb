#!/bin/bash

set -e

export DEFAULT_NATS_SERVER_VERSION=v2.0.0

export NATS_SERVER_VERSION="${NATS_SERVER_VERSION:=$DEFAULT_NATS_SERVER_VERSION}"

export MOUNT_DIR="${GITHUB_WORKSPACE:=$HOME_DIR}"

# check to see if nats-server folder is empty
if [ ! -d $MOUNT_DIR/nats-server ]; then
    (
	mkdir -p $MOUNT_DIR/nats-server
	cd $MOUNT_DIR/nats-server
	wget https://github.com/nats-io/nats-server/releases/download/$NATS_SERVER_VERSION/nats-server-$NATS_SERVER_VERSION-linux-amd64.zip -O nats-server.zip
	unzip nats-server.zip
	cp nats-server-$NATS_SERVER_VERSION-linux-amd64/nats-server $MOUNT_DIR/nats-server/nats-server
    )
else
  echo 'Using cached directory.';
fi
