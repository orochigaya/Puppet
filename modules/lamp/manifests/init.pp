class lamp {

# execute 'yum update'
exec {'yum update':
  command => '/usr/bin/yum update'
}

# install apache2 package
package {'httpd':
  require => Exec['yum update'],
  ensure => installed,
}

# ensure apache2 service is running
service { 'httpd':
  ensure => running,
}

# install mysql-server package
package {'mariadb-server':
  ensure => installed
}

# ensure mysql service is running
service { 'mariadb':
  ensure => running,
}

# install php5 package
package { 'php':
  require => Exec['yum update'],
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',   
  require => Package['httpd'],        
}

}
