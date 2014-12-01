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

# install mosh (the Mobile SHell)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mosh

# modify yeoman to run as root
sed -i 's~rootCheck();~// rootCheck();~g' /usr/lib/node_modules/yo/cli.js

# make sshd happy
RUN mkdir /var/run/sshd

# configure git
RUN git config --global color.ui auto; \
    git config --global color.branch.current yellow reverse; \
    git config --global color.branch.local yellow; \
    git config --global color.branch.remote green; \
    git config --global color.diff.meta yellow bold; \
    git config --global color.diff.frag magenta bold; \
    git config --global color.diff.old red bold; \
    git config --global color.diff.new green bold; \
    git config --global color.status.added yellow; \
    git config --global color.status.changed green; \
    git config --global color.status.untracked cyan; \
    git config --global i18n.logoutputencoding UTF-8; \
    git config --global i18n.commitencoding UTF-8; \
    git config --global core.autocrlf input; \
    git config --global push.default simple; \
    git config --global user.email "mdt@wegewerk.com"; \
    git config --global user.name "mdt";

ADD .bash_aliases /root/
ADD sshd_config /etc/ssh/sshd_config

RUN mkdir /root/.ssh && chmod 600 /root/.ssh
ADD authorized_keys /root/.ssh/

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
