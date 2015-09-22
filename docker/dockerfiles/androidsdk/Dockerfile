# android sdk box
#
# VERSION               0.0.1

FROM     wwmdt/devbox
MAINTAINER mdt "mdt@wegewerk.com"

# sdk install script
ADD install_deps.sh /root/
RUN chmod +x /root/install_deps.sh
RUN /root/install_deps.sh

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
