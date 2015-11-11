# sshd
#
# VERSION               0.0.1

FROM     wwmdt/devbox
MAINTAINER mdt "mdt@wegewerk.com"

ENV LC_ALL de_DE.UTF-8

RUN curl https://install.meteor.com/ | sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
