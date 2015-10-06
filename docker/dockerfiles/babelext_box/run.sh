#!/bin/sh
docker stop babelext_box && docker rm babelext_box

docker run -d -p 2223:22 \
           --volumes-from data-container \
           --name babelext_box \
           -h babelext_box \
           crashc0de/babelext_box

