#!/bin/bash -x
# HeadURL: https://github.com/danielhoherd/homepass/blob/master/RaspberryPi/setup.sh
# Set up homepass functionality on base Raspbian
# So quick, so dirty. So dirty, in fact, that it doesn't actually work all the way.

apt-get install -y git sqlite3 screen vim wget bridge-utils

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 wlan0
brctl show br0
