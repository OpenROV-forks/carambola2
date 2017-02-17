#!/bin/bash

# Enable wifi
uci set wireless.@wifi-device[0].disabled=0

# Default SSID
# Buoy SSID will be Trident-[last four chars of MAC Address]
SSID="Trident-0000"

# Get the whole MAC address
MAC_ADDR=$(cat /sys/class/net/wlan0/address)

# If we couldn't find it for some reason, default out
if [ -z "$MAC_ADDR" ]; then
    MAC_ADDR="00:00:00:00:aa:00"
fi

# Strip colons
MAC_ADDR="${MAC_ADDR//:}"

# Get last four characters
MAC_ADDR=$(echo $MAC_ADDR | tail -c 5)

# All uppercase
MAC_ADDR=$(echo "$MAC_ADDR" | awk '{print toupper($0)}')

SSID="Trident-$MAC_ADDR"

# Set the SSID to this ID
uci set wireless.@wifi-iface[0].ssid=$SSID

# Commit our changes
uci commit wireless

# Let uci know we are good to go. This will delete the script
exit 0