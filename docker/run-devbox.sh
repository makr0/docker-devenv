#!/bin/sh
docker stop devbox && docker rm devbox

# backticks used for comments. see http://stackoverflow.com/questions/9522631/bash-how-to-put-line-comment-for-a-multi-line-command#12797512
docker run -d             `# ??` \
           -p 2222:22     `# ssh` \
           -p 35729:35729 `# livereload` \
           -p 8888:8888   `# local server` \
           -p 8889:8889   `# local server` \
           -p 8100:8100   `# local server` \
           --volumes-from data-container \
           --name devbox \
           -h devbox \
           crashc0de/devbox

