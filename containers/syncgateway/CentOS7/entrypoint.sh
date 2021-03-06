#!/bin/bash

COUCHBASE_SERVER_URL=$1
SYNC_GATEWAY_CONFIG=/home/sync_gateway/sync_gateway.json

echo "Using CBS: ${COUCHBASE_SERVER_URL}"

# Replace 'COUCHBASE_SERVER_URL in /etc/sync_gateway/config.json with Server IP
sed -i "s/\(node0\)\(.*\)/${COUCHBASE_SERVER_URL}\2/" $SYNC_GATEWAY_CONFIG

# start sync gateway
exec systemctl start sync_gateway
