#!/bin/bash

trap exit SIGINT SIGTERM

SLEEP_TIME=300
MAC_FILE=/etc/hostapd/mac_nintendozone
STREETPASS_REFRESH=28800
_IP=$(hostname -I)


CONFIG_FILE=/tmp/nz_config.conf
if [[ ! -p $CONFIG_FILE ]]; then
    mkfifo $CONFIG_FILE
fi

while true ; do

sort -R $MAC_FILE | while read MAC SSID ; do

cat > $CONFIG_FILE <<EOF
interface=wlan0
ssid=$SSID
bssid=$MAC
bridge=br0
driver=nl80211
ctrl_interface=wlan0
ctrl_interface_group=0
hw_mode=g
channel=5
wpa=0
rsn_pairwise=CCMP
beacon_int=100
auth_algs=3
wmm_enabled=0
eap_reauth_period=360000000

macaddr_acl=1
accept_mac_file=/etc/hostapd/accept
EOF

echo 
echo 
echo 
echo "==========================================="
echo "        SpillPass Pi Up and Running!       "
echo 
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi
echo 
echo "SSID:" $SSID "- BSSID:" $MAC
echo
echo "Time before next change:" $SLEEP_TIME "seconds"
echo "Current time:" $(date -u)
echo
echo "        To Detach from this screen,        "
echo "         Press Ctrl + A and then D         "
echo
echo "You can SSH to the IP of this device using "
echo "           root  /  SpillPassPi            "
echo
echo "        Editable MAC List located at       "
echo "       /etc/hostapd/mac_nintendozone       "
echo 
echo "==========================================="
echo 
echo 
echo 
echo 
echo 

timeout $SLEEP_TIME hostapd $CONFIG_FILE

echo ""
echo ""
	done

echo "~~~~Looping Back to Beginning~~~~"
done
