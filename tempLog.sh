#!/bin/bash

touch tempLog.txt

while true
    do
	tim=$(date)    
        timi=$(date +%s)
        tempi=$(cat /sys/bus/w1/devices/w1_bus_master1/28-0517a238e3ff/w1_slave |grep t=| grep -o ".....$")
        tempi=$(echo "scale=2; $tempi/1000"|bc -l)
	stati=$(bash /home/pi/eq3tools/eq3status.sh 00:1A:22:08:AE:3E)
	sleep 2s
        echo $tim $timi $tempi $stati >> tempLog.txt
	sleep 120s

done

