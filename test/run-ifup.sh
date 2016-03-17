#!/bin/sh
set -x

switch=br0

if [ -n "$1" ];then
        tunctl -u `whoami` -t $1
        ip link set $1 up
        sleep 0.5s
        brctl addif $switch $1
        exit 0
else
        echo "Error: no interface specified"
        exit 1
fi

#echo "Bringing up $1 for bridged mode..."
#sudo ifconfig $1 0.0.0.0 promisc up
#echo "Adding $1 to br0..."
#sudo brctl addif br0 $1
#sleep 2