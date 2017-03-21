#!/bin/bash

IP_ADDR="10.1.1.1"

# Set the default IP address for the Carambola
uci set network.lan.ipaddr="$IP_ADDR"
uci set network.lan.igmp_snooping="1"
uci commit network

# Wifi setup
uci set wireless.radio0.channel="auto"
uci set wireless.radio0.htmode="HT40"
uci set wireless.radio0.txpower="22"


# Firewall setup
uci add firewall rule
uci set firewall.@rule[-1].name="Allow-IGMP"
uci set firewall.@rule[-1].src="wan"
uci set firewall.@rule[-1].proto="igmp"
uci set firewall.@rule[-1].family="ipv4"
uci set firewall.@rule[-1].target="ACCEPT"
uci commit firewall

# Let uci know we are good to go. This will delete the script
exit 0
