class homepass {
  file { '/etc/network/interfaces':
    ensure  => 'file',
    group   => '0',
    mode    => '644',
    owner   => '0',
    source  => 'puppet:///modules/homepass/interfaces'
  }
}
