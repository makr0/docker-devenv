#!/bin/sh
docker stop data-container && docker rm data-container;
docker run -v /home/vagrant/docker-data-container/:/data \
           -v /home/vagrant/docker-config-container/:/config \
           --name data-container \
           busybox true
