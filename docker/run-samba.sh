#!/bin/sh
docker run --rm -v $(which docker):/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba data-container