class cron_puppet {
    file { 'post-hook':
        ensure  => file,
        path    => '/srv/code/homepass/.git/hooks/post-merge',
        source  => 'puppet:///modules/cron_puppet/post-merge',
        mode    => "0755",
        owner   => root,
        group   => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "( cd /srv/code/homepass ; /usr/bin/git reset --hard ; /usr/bin/git clean -ffdx ; /usr/bin/git pull ) 2>&1 | /usr/bin/logger -t puppet-apply ; systemctl restart homepass ;",
        user    => root,
        minute  => '14',
        require => File['post-hook'],
    }
}

# vim: tabstop=2 expandtab fenc=utf-8
