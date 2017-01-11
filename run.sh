#!/bin/bash -e

NAME='chef-server'

HOST_NAME=chef-server
NETWORK_NAME=dev_nw

docker stop "${NAME}" 2>/dev/null && sleep 1
docker rm "${NAME}" 2>/dev/null && sleep 1
#docker run -it --name "${NAME}" --hostname "${HOST_NAME}" \
docker run --detach=true --name "${NAME}" --hostname "${HOST_NAME}" \
    -p 443:443 \
    --network=${NETWORK_NAME} \
    redwyvern/chef-server \
    /bin/bash
