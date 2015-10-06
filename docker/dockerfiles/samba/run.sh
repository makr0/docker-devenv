#!/bin/sh
docker stop sambaserver && docker rm sambaserver
docker run -d -p 137-139:137-139 -p 445:445 \
       --name sambaserver \
       --volumes-from data-container wwmdt/sambaserver

