# my wifi connect

## Prerequisites

Network manager must be running on the host and not dhcpcp.
If that is not the case you can use following steps to configure host:

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

# disconnect wifi - the <CONNECTION_NAME> is returned by `nmclid d``
sudo nmcli con down id "<CONNECTION NAME>"
```
