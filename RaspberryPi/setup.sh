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

/srv/homepass/bin/db_update.sh
#reboot
