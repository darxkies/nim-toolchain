FROM darxkies/buildroot:2019.02.3

ADD files/.config /buildroot/.config

RUN make

FROM ubuntu:19.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q ca-certificates vim openssl upx && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=0 /buildroot/output/host/ /opt/toolchain/

COPY --from=0 /opt/nim/ /opt/nim

RUN mkdir -p /workspace

WORKDIR /workspace

ENV PATH=/opt/nim/bin:/opt/toolchain/bin:$PATH

ENV LD_LIBRARY_PATH=/opt/toolchain/lib

ADD files/nim.cfg /root/.config/nim/nim.cfg

RUN ln -s /opt/toolchain/bin/x86_64-buildroot-linux-musl-strip /opt/toolchain/bin/strip
