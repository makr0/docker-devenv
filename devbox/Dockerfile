# sshd
#
# VERSION               0.0.2

FROM     ubuntu:latest
MAINTAINER mdt "mdt@wegewerk.com"

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y apt-utils

# install php and modules needed in cli mode
RUN apt-get install -y openssh-server git gitk git-gui curl vim mc build-essential
RUN apt-get install -y dnsutils pwgen

RUN locale-gen de_DE.UTF-8 && update-locale LANG=de_DE.UTF-8

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# install bower yo grunt ...
RUN npm install -g bower grunt-cli yo gulp

# some dotfiles
ADD .bash_aliases /root/
ADD .gitconfig /root/

# add Install-Script for Android SDK
ADD install_androidsdk.sh /root/
RUN chmod +x /root/install_androidsdk.sh

# make sshd happy
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh && chmod 600 /root/.ssh
ADD sshd_config /etc/ssh/sshd_config
ADD authorized_keys /root/.ssh/

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
