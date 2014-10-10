#!/bin/sh
docker stop devbox && docker rm devbox
docker run -d -p 2222:22 --volumes-from data-container --name devbox crashc0de/devbox

