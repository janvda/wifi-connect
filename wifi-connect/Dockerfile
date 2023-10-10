FROM debian:buster-20230919

RUN apt-get update && \
    apt-get install -y dnsmasq wireless-tools network-manager curl wget \
     && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# possible values for BALENA_ARCH: armv7hf amd64 aarch64
RUN ARCH=`uname -m` && \
    if   [ "$ARCH" == "x86_64" ]; then BALENA_ARCH=amd64; \
    elif [ "$ARCH" == "armv7l" ]; then BALENA_ARCH=armv7hf;\
    else                               BALENA_ARCH=aarch64; fi && \
    wget https://github.com/balena-os/wifi-connect/releases/download/v4.4.4/wifi-connect-v4.4.4-linux-${BALENA_ARCH}.tar.gz \
    && tar -xvf wifi-connect-*.tar.gz \
    && rm wifi-connect-*.tar.gz

COPY scripts/start.sh .

#CMD sleep 36000
CMD ["bash", "start.sh"]
