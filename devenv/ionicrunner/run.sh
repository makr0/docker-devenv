#!/bin/sh
docker stop ionicrunner && docker rm ionicrunner
docker run -d \
           --name ionicrunner \
           -e 'RUNNER_TOKEN=dingdong' \
           -e 'CI_SERVER=http://gitlab.loc.int:10180/' \
           wwmdt/ionicrunner

