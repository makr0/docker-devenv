# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER mdt "mdt@wegewerk.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y

# install php and modules needed in cli mode
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server \
                                                      php5-curl php5-gd php5-cli \
                                                      git curl vim mc ruby ruby-dev build-essential
RUN locale-gen de_DE.UTF-8 && update-locale LANG=de_DE.UTF-8

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash - && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# install composer and bower
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN npm install -g bower grunt-cli yo
RUN gem install sass compass

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gitk git-gui

# install cordova and ionic
RUN npm install -g cordova ionic

# install other Commandline Tools
# mosh (the Mobile SHell)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mosh

# pouchdb-dump-cli (Dump Couchdb Databases for loading in pouchDB)
RUN npm install -g pouchdb-dump-cli

# modify yeoman to run as root
RUN sed -i 's~rootCheck();~// rootCheck();~g' /usr/lib/node_modules/yo/cli.js

# some dotfiles
ADD .bash_aliases /root/
ADD .gitconfig /root/

# make sshd happy
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh && chmod 600 /root/.ssh
ADD sshd_config /etc/ssh/sshd_config
ADD authorized_keys /root/.ssh/

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
