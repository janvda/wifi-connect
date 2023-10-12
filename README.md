# my wifi connect

This service allows you to (re)configure your wifi connection if your device has no working wifi connection (E.g. if you want to use your device in another wifi network).
In that case this service will setup a wifi access point with SSID `wifi-connect...` (and no password) and also provides a web site allowing to specify the new wifi network and password that it must connect to.

More specifically (see also [docker-compose.yml](docker-compose.yml)) you have to execute followng steps

1. Using your smart phone/tablet/laptop connect to the wifi network with SSID = `wifi-connect...`
2. open following URL in web browser:  http://192.168.50.1:1000
3. select the wifi network you want to connect and specify its password.
    * Note that this will stop the wifi access point.
    * if everything went fine, your device should connect to the specified WiFi network.
