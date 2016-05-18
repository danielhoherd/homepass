class homepass {
  package { 'hostapd':
    ensure => latest,
  }

  file { '/etc/network/interfaces':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/interfaces',
  }

  file { '/etc/hostapd/hostapd.conf':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/hostapd.conf',
  }

  file { '/etc/hostapd/accept':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/accept',
  }

  file { '/lib/systemd/system/homepass.service':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/homepass.service',
  }

  file { '/etc/systemd/system/syslog.service':
    ensure => 'link',
    mode   => '777',
    group  => 'root',
    owner  => 'root',
    target => '/lib/systemd/system/homepass.service',
    type   => 'link',
  }

  file { '/etc/systemd/system/getty.target.wants/getty@tty1.service':
    ensure => 'absent',
  }

}

