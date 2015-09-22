#!/bin/sh
docker run --rm -v $(which docker):/docker \
       -e 'USER=samba' \
       -v /var/run/docker.sock:/docker.sock svendowideit/samba data-container
