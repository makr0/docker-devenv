# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER mdt "mdt@wegewerk.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y

# install php and modules needed in cli mode
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server \
                                                      php5-curl php5-gd php5-cli \
                                                      git curl vim

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash - && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# install composer and bower
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN npm install -g bower

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

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D", "-f", "/config/ssh/sshd_config"]