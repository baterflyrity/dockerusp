FROM cruizba/ubuntu-dind

LABEL author="baterflyrity"
LABEL mail="baterflyrity@yandex.ru"
LABEL home="https://github.com/baterflyrity/dockerusp"
LABEL version="1.0.1"
LABEL description="Docker + Ubuntu + SSH + Python - finally all out of the box!"

# Prepare apt
RUN apt-get update

# Install Python
RUN apt-get install python3-dev pip -y --no-install-recommends

# Install OpenSSH
RUN apt-get install openssh-server sudo -y --no-install-recommends
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 999 user &&\
	echo 'user:user' | chpasswd &&\
	chown user -R /home/ubuntu
RUN service ssh start
COPY sshd_root.conf /etc/ssh/sshd_config.d/sshd_root.conf
EXPOSE 22

# Enable remote docker access
# COPY daemon.json /etc/docker/daemon.json
# EXPOSE 2375

# Autostart stuff
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh