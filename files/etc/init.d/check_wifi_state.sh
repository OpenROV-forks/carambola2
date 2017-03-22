#!/bin/sh
LED_STATE=0

while true
do
        # Change the state of the LED
        if [ $LED_STATE -eq 1 ]; then
                LED_STATE=0
        else
                LED_STATE=1
        fi

        # Write the state
        echo $LED_STATE > /sys/class/gpio/gpio22/value

        if ifconfig wlan0 | grep UP; then
                echo 0 > /sys/class/gpio/gpio22/value
                exit 0
        fi
        # Check the state of the wifi
        sleep 1
done

