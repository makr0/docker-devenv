FROM realyze/google-chrome-30.0.1599.101

MAINTAINER mdt "mdt@wegewerk.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server \
                                                      git curl git curl vim mc

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash - && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# install phantomjs
RUN npm install -g phantomjs

RUN locale-gen de_DE.UTF-8 && update-locale LANG=de_DE.UTF-8


# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# Allow root to execute Google Chrome by replacing launch script
ADD google-chrome-launcher /usr/bin/google-chrome
RUN chmod a+x /usr/bin/google-chrome

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

ENV DISPLAY :99
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
