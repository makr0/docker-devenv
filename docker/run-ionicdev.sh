#!/bin/sh
docker stop ionicdev && docker rm ionicdev
# vom docker-host zugängliche Ports
# 8100: ionic server
# 35729: live-reload
# 2223: ssh
docker run -d \
           -p 35729:35729 \
           -p 8100:8100 \
           -p 2223:22 \
           --volumes-from data-container \
           --name ionicdev \
           -h ionicdev \
           wwmdt/ionicdev \

