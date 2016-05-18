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

  file { '/srv/':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/srv/homepass':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/srv/homepass/bin':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/srv/homepass/lib':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/srv/homepass/bin/homepass.sh':
    ensure  => 'file',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/homepass.sh',
  }

  file { '/srv/homepass/bin/update_db.sh':
    ensure  => 'file',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/update_db.sh',
  }

  file { '/etc/network/interfaces':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/interfaces',
  }

  file { '/etc/hostapd/hostapd.conf':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/hostapd.conf',
    require => Package['hostapd'],
  }

  file { '/etc/hostapd/accept':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/accept',
    require => Package['hostapd'],
  }

  file { '/lib/systemd/system/homepass.service':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/homepass/homepass.service',
  }

  file { '/etc/systemd/system/homepass.service':
    ensure => 'link',
    mode   => '0777',
    owner  => 'root',
    group  => 'root',
    target => '/lib/systemd/system/homepass.service',
  }

  file { '/etc/systemd/system/getty.target.wants/getty@tty1.service':
    ensure => 'absent',
  }

}

