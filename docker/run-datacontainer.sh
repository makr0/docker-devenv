#!/bin/sh
docker run -v /mnt/sda1/docker-data-container/:/data -v /mnt/sda1/docker-config-container/:/config --name data-container busybox true