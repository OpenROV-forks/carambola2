#!/bin/sh /etc/rc.common

START=15
STOP=20

start(){
        echo 22 > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio22/direction

        ./check_wifi_state.sh &
        exit 0
}

