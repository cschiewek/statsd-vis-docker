from alpine:latest

EXPOSE 8125/udp` 8080
ENV RELEASE statsd-vis-v0.1-linux-amd64
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates && \
    wget -nv https://github.com/rapidloop/statsd-vis/releases/download/v0.1/${RELEASE}.zip && \
    unzip ${RELEASE}.zip && \
    mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
CMD ./${RELEASE}
