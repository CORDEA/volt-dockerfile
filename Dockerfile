FROM ubuntu:latest

MAINTAINER Yoshihiro Tanaka <contact@cordea.jp>


RUN apt -y update && \
    apt -y install wget gdc-6 llvm-6.0 clang-6.0 lld-6.0 nasm git libcurl-openssl1.0-dev zlib1g-dev

ENV HOME /root/

WORKDIR $HOME

RUN mkdir volt

WORKDIR $HOME/volt

RUN git clone https://github.com/VoltLang/Watt.git && \
    git clone https://github.com/VoltLang/Volta.git && \
    wget https://github.com/VoltLang/Battery/releases/download/v0.1.18/battery-0.1.18-x86_64-linux.tar.gz && \
    tar xzvf battery-0.1.18-x86_64-linux.tar.gz && \
    rm battery-0.1.18-x86_64-linux.tar.gz && \
    mv battery /usr/local/bin

WORKDIR $HOME

ENTRYPOINT ["/bin/bash"]
