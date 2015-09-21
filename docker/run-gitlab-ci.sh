#!/bin/sh
docker stop gitlab-ci && docker rm gitlab-ci
docker run  -d \
			--name=gitlab-ci \
			-p 10180:80 -e 'GITLAB_URL=http://gitlab.loc.int:10080' \
			-e 'GITLAB_APP_ID=0c19c52d2b8bbb5d5e2847158b0a7689e9c2ad61a527a5e3488456c6b1f5a03a' -e 'GITLAB_APP_SECRET=423e4efe9f9f3bbfbf63a57796630f9385c2f3ccb3b0e4ba19db2fd06b28008a' \
			-v /var/run/docker.sock:/run/docker.sock \
			-v $(which docker):/bin/docker \
			-h gitlab-ci \
			sameersbn/gitlab-ci:7.9.1