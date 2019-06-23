FROM ubuntu:19.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q bash bc binutils build-essential bzip2 ca-certificates cpio debianutils file g++ gcc git graphviz gzip libncurses5-dev locales make patch perl python python-matplotlib rsync sed tar unzip wget vim && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV BUILDROOT_VERSION 2019.02.3

RUN wget -qO- http://buildroot.org/downloads/buildroot-$BUILDROOT_VERSION.tar.gz | tar xz && mv buildroot-$BUILDROOT_VERSION /buildroot

ENV FORCE_UNSAFE_CONFIGURE=1

WORKDIR /buildroot

ENV NIM_VERSION 0.20.0

RUN cd /opt && wget https://nim-lang.org/download/nim-${NIM_VERSION}-linux_x64.tar.xz && tar xfv ./nim-${NIM_VERSION}-linux_x64.tar.xz && rm ./nim-${NIM_VERSION}-linux_x64.tar.xz && mv nim-${NIM_VERSION} nim
