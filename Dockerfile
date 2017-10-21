FROM ubuntu:latest

MAINTAINER Yoshihiro Tanaka <contact@cordea.jp>


RUN apt-get -y update && \
    apt-get install -y wget llvm-4.0 clang-4.0 nasm git libcurl4-openssl-dev zlib1g-dev && \
    wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    wget -qO - https://dlang.org/d-keyring.gpg | apt-key add - && \
    apt-get -y update && \
    apt-get install -y --allow-unauthenticated dmd-bin

ENV HOME /root/

WORKDIR $HOME

RUN mkdir volt

WORKDIR $HOME/volt

RUN git clone https://github.com/VoltLang/Watt.git && \
    git clone https://github.com/VoltLang/Volta.git && \
    wget https://github.com/VoltLang/Battery/releases/download/v0.1.13/battery-0.1.13-x86_64-linux.tar.gz && \
    tar xzvf battery-0.1.13-x86_64-linux.tar.gz && \
    rm battery-0.1.13-x86_64-linux.tar.gz

WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
