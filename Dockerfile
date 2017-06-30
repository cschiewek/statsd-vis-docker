from alpine:latest

EXPOSE 8125/udp 8125/tcp 8080
ENV VERSION 0.1
ENV RELEASE statsd-vis-v${VERSION}-linux-amd64
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates && \
    wget -nv https://github.com/rapidloop/statsd-vis/releases/download/v${VERSION}/${RELEASE}.zip && \
    unzip ${RELEASE}.zip && \
    mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
CMD ./${RELEASE} -statsdtcp 0.0.0.0:8125 -statsdudp 0.0.0.0:8125
