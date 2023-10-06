FROM debian:trixie-20230919

RUN apt-get update && \
    apt-get install -y dnsmasq wireless-tools network-manager curl \
     && apt-get clean && rm -rf /var/lib/apt/lists/*

# https://github.com/balena-os/wifi-connect/releases/download/v4.4.0/wifi-connect-v4.4.0-linux-amd64.tar.gz

CMD sleep 36000
