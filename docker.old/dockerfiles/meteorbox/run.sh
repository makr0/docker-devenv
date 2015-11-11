#!/bin/sh
docker stop meteorbox && docker rm meteorbox

# backticks used for comments. see http://stackoverflow.com/questions/9522631/bash-how-to-put-line-comment-for-a-multi-line-command#12797512
docker run -d             `# ??` \
           -p 2225:22     `# ssh` \
           -p 3000:3000   `# meteor` \
           --volumes-from data-container \
           --name meteorbox \
           -h meteorbox \
           wwmdt/meteorbox

