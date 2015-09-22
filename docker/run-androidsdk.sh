#!/bin/sh
docker stop androidsdk && docker rm androidsdk
# vom docker-host zugängliche Ports
# 2223: ssh
docker run -d \
           -p 2224:22 \
           --volumes-from data-container \
           --name androidsdk \
           -h androidsdk \
           wwmdt/androidsdk

