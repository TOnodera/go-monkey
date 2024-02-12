FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y git vim wget curl ca-certificates \
  language-pack-ja gcc build-essential sudo tmux \
  software-properties-common 

RUN update-locale LANG=ja_JP.UTF-8

ENV LANG="ja_JP.UTF-8"
ENV LANGUAGE="ja_JP:ja"
ENV LC_ALL="ja_JP.UTF-8"
ENV LC_ALL="ja_JP.UTF-8"
ENV TZ="JST-9"

ARG username=goer
ARG wkdir=/home/goer

# echo "username:password" | chpasswd
# root password is "root"

RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --shell /bin/bash --home /home/goer --gecos "" "${username}" && \
    echo "${username}:${username}" | chpasswd && \
    echo "%${username}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/${username} && \
    chmod 0440 /etc/sudoers.d/${username} 

WORKDIR ${wkdir}
COPY ./ ${wkdir}

# install go1.7.linux-amd64.tar.gz
RUN wget https://go.dev/dl/go1.7.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.7.linux-amd64.tar.gz \
  && rm go1.7.linux-amd64.tar.gz
RUN chown -R ${username}:${username} ${wkdir}

USER ${username}
RUN whoami
RUN echo 'export PATH=$PATH:/usr/local/go/bin' > ~/.profile 
CMD sleep infinity
