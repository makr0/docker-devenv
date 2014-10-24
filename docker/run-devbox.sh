#!/bin/sh
docker rm devbox
docker run -d -p 35729:35729 -p 8100:8100 -p 2222:22 -p 8888:8888 -p 8889:8889 --volumes-from data-container --name devbox crashc0de/devbox

