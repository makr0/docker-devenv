#!/bin/sh
docker rm devbox
docker run -d -p 2222:22 --volumes-from data-container --name devbox crashc0de/devbox /usr/sbin/sshd -D -f /config/ssh/sshd_config

