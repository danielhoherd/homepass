#!/usr/bin/env bash
# HeadURL: https://github.com/danielhoherd/homepass/blob/master/RaspberryPi/homepass.sh

CONFIG_FILE=/etc/hostapd/hostapd.conf
RELAY_TIME=100
DB=/root/homepass.db

service hostapd stop ; sleep 1 ;
pkill hostapd ; sleep 1 ;
pkill -9 hostapd

while true ; do
  aps=()
  #aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps where last_used < datetime('now','-8 hours') or last_used is NULL) order by random() ;") )
  #aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps order by last_used asc limit 10 ) order by random() ;") )
  #aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps where ssid='wifine' order by last_used asc limit 10 ) order by random() ;") )
  #aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps where ssid='NZ@McD1' order by last_used asc limit 10 ) order by random() ;") )
  aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps where ssid='attwifi' order by last_used asc limit 10 ) order by random() ;") )
  aps+=( $(sqlite3 "${DB}" "select * from (select mac,ssid from aps where ssid='attwifi' and mac like '4E:53:50:4F:4F:%' and last_used < datetime('now','-12 hours') order by last_used asc limit 10 ) order by random() ;") )

  p=${aps[$(( RANDOM % ${#aps[@]} ))]}

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
channel=$(( RANDOM % 13 + 1 ))
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
  echo "$(date "+%F %T%z") ${MAC} ${SSID} Starting relay for ${RELAY_TIME} seconds"
  timeout "${RELAY_TIME}" hostapd /etc/hostapd/hostapd.conf 2>&1 | while read -r X ; do echo "$(date "+%F %T%z") ${MAC} ${SSID} ${X}" ; done ;
done
