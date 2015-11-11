#!/bin/sh
docker stop gitlab && docker rm gitlab
docker run -d \
           --name='gitlab' \
           -e 'GITLAB_PORT=10080' -e 'GITLAB_SSH_PORT=10022' \
           -p 10022:22 -p 10080:80 \
           -v /var/run/docker.sock:/run/docker.sock \
           -v $(which docker):/bin/docker \
           -h gitlab \
           sameersbn/gitlab
