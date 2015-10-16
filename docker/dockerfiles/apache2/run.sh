#!/bin/sh
docker stop webserver && docker rm webserver
docker run -d -p 80:80 \
       --name webserver \
       --add-host="backend.konferenz-app.loc.int":10.1.1.2 \
       --link igmcouch \
       --volumes-from data-container wwmdt/webserver53

