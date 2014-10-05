# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER mdt "mdt@wegewerk.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server
RUN mkdir /var/run/sshd


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-f /config/ssh/sshd_config"]
