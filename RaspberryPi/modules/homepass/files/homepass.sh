#!/bin/bash

CONFIG_FILE=/etc/hostapd/hostapd.conf
RELAY_TIME=120
DB=/srv/homepass/lib/homepass.db

systemctl stop hostapd ; sleep 3 ;

while true ; do
    #p=$(sqlite3 "${DB}" "select * from (select mac, ssid from aps order by last_used asc limit 25 ) order by random() limit 1 ;")
    p=$(sqlite3 "${DB}" "select * from (select mac,ssid from aps where last_used < datetime('now','-5 days') or last_used is NULL) order by random() limit 1 ;")
    MAC="${p%|*}"
    SSID="${p#*|}"
    [ ! -z "$MAC" ] && [ ! -z "$SSID" ] || exit 1
    sqlite3 "${DB}" "update aps set last_used = datetime('now') where mac = '$MAC' and ssid = '$SSID' ;"

    cat > $CONFIG_FILE <<EOF
ssid=$SSID
bssid=$MAC

interface=wlan0
bridge=br0
ctrl_interface=wlan0
ctrl_interface_group=0
hw_mode=g
channel=5
wpa=0
rsn_pairwise=CCMP
beacon_int=100
auth_algs=3

driver=nl80211
ieee80211n=1

macaddr_acl=1
accept_mac_file=/etc/hostapd/accept

wmm_enabled=0
eap_reauth_period=360000000
EOF

    echo
    date "+%F %T *******************************************************"
    echo "                    Starting relay ${MAC} ${SSID} for ${RELAY_TIME} seconds"
    echo
    echo
    timeout "${RELAY_TIME}" hostapd /etc/hostapd/hostapd.conf
done
