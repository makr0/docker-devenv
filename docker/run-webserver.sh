#!/bin/sh
docker stop webserver && docker rm webserver
docker run -d -p 80:80 --name webserver --volumes-from data-container crashc0de/webserver53

