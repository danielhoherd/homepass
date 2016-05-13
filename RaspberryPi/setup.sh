#!/bin/bash -x
apt update
apt full-upgrade -y
apt install -y puppet
puppet apply /vagrant/manifests

# apt-get install -y git sqlite3 screen vim wget bridge-utils
# brctl addbr br0
# brctl addif br0 eth0
# brctl addif br0 wlan0
# brctl show br0
