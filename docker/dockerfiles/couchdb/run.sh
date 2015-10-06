#!/bin/sh
docker stop igmcouch && docker rm igmcouch
docker run -d -p 5984:5984 --volumes-from data-container --name igmcouch crashc0de/igmcouch


