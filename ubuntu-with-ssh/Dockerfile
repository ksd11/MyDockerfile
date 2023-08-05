FROM ubuntu:latest


ENV USER="ksd1"
ENV PASSWORD="123"

# 防止apt安装时卡顿
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
# apt update有些源更新不了，忽略
RUN apt update || true
RUN apt install  openssh-server -y
RUN apt install sudo -y

# Create a user “ksd1” and group “ksd1”
RUN groupadd $USER && useradd -ms /bin/bash -g $USER $USER 
RUN echo "$USER:$PASSWORD" | chpasswd
RUN echo "$USER  ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers 

# Create sshuser directory in home
# RUN mkdir -p /home/ksd1/.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
# COPY idkey.pub /home/ksd1/.ssh/authorized_keys
# change ownership of the key file. 
# RUN chown ksd1:ksd1 /home/ksd1/.ssh/authorized_keys && chmod 600 /home/ksd1/.ssh/authorized_keys
# Start SSH service
RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
