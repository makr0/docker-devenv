# sshd
#
# VERSION               0.0.1

FROM     wwmdt/ionicdev
MAINTAINER mdt "mdt@wegewerk.com"

RUN npm install -g gcr

CMD /usr/bin/gcr --url $CI_SERVER --token $RUNNER_TOKEN
