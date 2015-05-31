#!/bin/bash -x
#
# Set up spillpass pi functionality on base Raspian

apt-get install -y git bridge-utils && \
wget https://github.com/jenssegers/RTL8188-hostapd/archive/v2.0.tar.gz && \
tar -zxvf v2.0.tar.gz && \
cd RTL8188-hostapd-2.0/hostapd && \
make && make install

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 wlan0
brctl show br0
