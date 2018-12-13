class ssh{

# execute 'yum update'
exec {'yum update':
  command => '/usr/bin/yum update'
}

# install ssh-server package
package {'openssh-server':
  require => Exec['yum update'],
  ensure => installed,
}

# install ssh-client package
package {'openssh-clients':
  require => Exec['yum update'],
  ensure => installed,
}

# ensure ssh service is running
service { 'sshd':
  ensure => running,
}

file { 'sshd_config':                                # file resource name
  path => '/etc/ssh/sshd_config',
  ensure => file,
  source => 'puppet:///modules/ssh/sshd_config',
}

}
