# my wifi connect

For generic information about the wifi-connect service you have to consult [wifi-connect/README](./wifi-connect/README.md).

## My specific setup

The docker-compose files (especially [docker-compose.yml](docker-compose.yml)) in this repository describe my specific setup.

Note that in my specific setup the captive portal cannot use port 80 as this is clashing with the traefik service that is also listening to that port.  Therefore the captive portal is configured to listen to port 1000.

## Instructions to reconfigure WiFi for my specific setup

I have to execute following steps if I need to (re)configure the WiFi of my device:

1. Using my smart phone/tablet/laptop connect to the wifi network with SSID = "`wifi-connect...`"
2. open following URL in web browser:  http://192.168.50.1:1000
3. select the wifi network I want to connect and specify its password.
    * Note that this will stop the wifi access point.
    * if everything went fine, my device should connect to the specified WiFi network.
