#!/usr/bin/env bash

printf "$(date +'%Y-%m-%d %H:%M:%S'): Starting script:$0\n"

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Optional step - it takes couple of seconds (or longer) to establish a WiFi connection
# sometimes. In this case, following checks will fail and wifi-connect
# will be launched even if the device will be able to connect to a WiFi network.
# If this is your case, you can wait for a while and then check for the connection.
printf "$(date +'%Y-%m-%d %H:%M:%S'): sleeping 15 seconds...\n"
sleep 15

# Choose a condition for running WiFi Connect according to your use case:

# 1. Is there a default gateway?
# ip route | grep default

# 2. Is there Internet connectivity?
# nmcli -t g | grep full

# 3. Is there Internet connectivity via a google ping?
# wget --spider http://google.com 2>&1

# 4. Is there an active WiFi connection?
printf "$(date +'%Y-%m-%d %H:%M:%S'): Check if there is an active WiFi connection\n"
iwgetid -r

if [ $? -eq 0 ]; then
    printf "$(date +'%Y-%m-%d %H:%M:%S'): Skipping WiFi Connect\n"
else
    printf "$(date +'%Y-%m-%d %H:%M:%S'): Starting WiFi Connect\n"
    ./wifi-connect
fi

printf "$(date +'%Y-%m-%d %H:%M:%S'): sleep infinity\n"
sleep infinity
