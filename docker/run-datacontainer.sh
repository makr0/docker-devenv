#!/bin/sh
docker stop data-container && docker rm data-container;
docker run -v /home/vagrant/dockerdata/:/data \
           -v /home/vagrant/dockerconf/:/config \
           --name data-container \
           busybox true
