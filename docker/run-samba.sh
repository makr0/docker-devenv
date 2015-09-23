#!/bin/sh
docker run --rm -v $(which docker):/docker \
       -e 'USER=root' \
       -v /var/run/docker.sock:/docker.sock svendowideit/samba data-container
