FROM debian:buster-20230919

RUN apt-get update && \
    apt-get install -y dnsmasq wireless-tools network-manager curl wget \
     && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

ARG BALENA_ARCH="armv7hf"
RUN curl -Ls https://github.com/balena-os/wifi-connect/releases/download/v4.4.4/wifi-connect-v4.4.4-linux-${BALENA_ARCH}.tar.gz \
 | tar -xvz -C  /usr/src/app/

COPY scripts/start.sh .

CMD ["bash", "start.sh"]
