# /etc/systemd/system/homepass.service
# /usr/local/bin/homepass.sh
# systemctl disable getty@tty1.service
# systemctl enable homepass

include ::homepass
include ::cron_puppet
