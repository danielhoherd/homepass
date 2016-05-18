class homepass {

  notify {"Running homepass class":
    withpath => true,
  }

  package { 'hostapd':
    ensure => latest,
  }

  package { 'bridge-utils':
    ensure => latest,
  }

  package { 'sqlite3':
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
    require => Package['hostapd'],
  }

  file { '/etc/hostapd/accept':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/accept',
    require => Package['hostapd'],
  }

  file { '/lib/systemd/system/homepass.service':
    ensure  => 'file',
    mode    => '0644',
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/homepass/homepass.service',
  }

  file { '/etc/systemd/system/homepass.service':
    ensure => 'link',
    mode   => '777',
    group  => 'root',
    owner  => 'root',
    target => '/lib/systemd/system/homepass.service',
  }

  file { '/etc/systemd/system/getty.target.wants/getty@tty1.service':
    ensure => 'absent',
  }

}

