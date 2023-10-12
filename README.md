# my wifi connect

This service allows you to (re)configure your wifi connection if your device has no working wifi connection (E.g. if you want to use your device in another wifi network).
In that case this service will setup a wifi access point with SSID `wifi-connect...` (and no password) and also provides a web site allowing to specify the new wifi network and password that it must connect to.

More specifically (see also [docker-compose.yml](docker-compose.yml)) you have to execute followng steps

1. Using your smart phone/tablet/laptop connect to the wifi network with SSID = `wifi-connect...`
2. open following URL in web browser:  http://192.168.50.1:1000
3. select the wifi network you want to connect and specify its password.
    * Note that this will stop the wifi access point.
    * if everything went fine, your device should connect to the specified WiFi network.

## Prerequisites

[Network manager](https://networkmanager.dev/docs/) must be running on the host and not dhcpcd.
If that is not the case you can:

* configure network manager as specified in [Network setup required for wifi-connect](https://github.com/janvda/pi3two#network-setup-required-for-wifi-connect) OR
* run the [networkmanager_setup.sh](networkmanager_setup.sh) script as specified in following steps:

1. copy script networkmanager_setup.sh to host directory /tmp

```shell
scp networkmanager_setup.sh pi@pi3three:/tmp
```

2. ssh to host and goto `/tmp`` folder
3. make script executable:

```shell
chmod a+x ./networkmanager_setup.sh
```

4. launch the script using nohup

```shell
sudo nohup ./networkmanager_setup <ssid> <password>
```

## Interesting commands to test

```shell
# nmcli device status
nmcli d

# list all wifi access points with ssid
nmcli d wifi list

# connect to wifi <SSID> with password <PASSWORD>
sudo nmcli dev wifi connect <SSID> password "<PASSWORD>"

# list (wifi) connections
nmcli c

# forget a wifi connection - this can be used to test wifi-connect.
sudo nmcli connection delete "<CONNECTION NAME>"
```
