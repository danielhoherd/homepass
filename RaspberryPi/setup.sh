#!/usr/bin/env bash
set -x
set -e

#apt update
#apt full-upgrade -y

apt install -y git vim
if [ ! -d /srv ] ; then mkdir /srv ; fi ;
cd /srv
mkdir code
cd code
git clone https://github.com/danielhoherd/homepass
cd homepass
git checkout raspbian8

apt install -y puppet
puppet apply /srv/code/homepass/RaspberryPi/manifests --modulepath=/srv/code/homepass/RaspberryPi/modules

# apt-get install -y git sqlite3 screen vim wget bridge-utils
# brctl addbr br0
# brctl addif br0 eth0
# brctl addif br0 wlan0
# brctl show br0
