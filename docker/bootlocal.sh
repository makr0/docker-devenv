#!/bin/sh
docker run -v /mnt/sda1/docker-data-container:/data --name data-container busybox true
docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba data-container

docker run -it --volumes-from data-container --name devbox -v `dirname $SSH_AUTH_SOCK`:`dirname $SSH_AUTH_SOCK` -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK crashc0de/devbox:v1 /bin/bash

