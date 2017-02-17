#!/bin/bash

IP_ADDR="10.1.1.1"

# Set the default IP address for the Carambola
uci set network.lan.ipaddr="$IP_ADDR"
uci commit network

# Let uci know we are good to go. This will delete the script
exit 0