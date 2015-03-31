# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER mdt "mdt@wegewerk.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y

# install php and modules needed in cli mode
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server \
                                                      gitk git-gui git \
                                                      curl vim mc ruby ruby-dev build-essential
RUN locale-gen de_DE.UTF-8 && update-locale LANG=de_DE.UTF-8

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash - && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# install all the hip build tools
RUN npm install -g bower grunt-cli yo gulp
RUN gem install sass compass

# install cordova and ionic
RUN npm install -g cordova ionic

# modify yeoman to run as root
# RUN sed -i 's~rootCheck();~// rootCheck();~g' /usr/lib/node_modules/yo/cli.js

# sshd setup
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh && chmod 600 /root/.ssh
ADD sshd_config /etc/ssh/sshd_config
ADD authorized_keys /root/.ssh/

# some dotfiles
ADD .bash_aliases /root/
ADD .gitconfig /root/

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
