#!/bin/sh
max_mtu=`ip -d link list | grep -A 1 eth0 | sed -n -e 's/^.*maxmtu //p' | awk '{print $1}'`
echo Maximum MTU is $max_mtu, attempting to set it.
sudo ip link set eth0 down
sudo ip link set dev eth0 mtu $max_mtu
sudo ip link set eth0 up
new_mtu=`ip link list | grep -A 1 eth0 | sed -n -e 's/^.* mtu //p' | awk '{print $1}'`
echo New MTU on eth0 is set to $new_mtu
