# /etc/systemd/system/homepass.service
# /usr/local/bin/homepass.sh
# systemctl disable getty@tty1.service
# systemctl enable homepass


file { '/etc/network/interfaces':
  ensure  => 'file',
  group   => '0',
  mode    => '644',
  owner   => '0',
  type    => 'file',
  source  => 'puppet:///files/interfaces'
}

