#!/bin/sh /etc/rc.common

START=15
STOP=20

start(){

        GPIO_BASE=`cat /sys/class/gpio/gpiochip*/base | head -n1`
        POWER_PIN=21
        GPIO=`expr $POWER_PIN + $GPIO_BASE`

        (echo $GPIO > /sys/class/gpio/export) >& /dev/null

        # Set the direction
        echo "out" > /sys/class/gpio/gpio$GPIO/direction

        # The LED should now be on
}

