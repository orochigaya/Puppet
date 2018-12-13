class proftpd::repo {
        package { "epel-release":
                  ensure => latest,
        }
}

class proftpd::install {
        package { "proftpd":
                 ensure => latest,
        }
}

class proftpd::config {
        file {"/etc/proftpd.conf":
                        owner  => 'root',
                        group  => 'root',
                        mode   => '0644',
                        content=> template("/etc/puppetlabs/code/modules/proftpd/templates/proftpd.conf.erb"),
                        require=> Class["proftpd::install"],
                        notify => Class["proftpd::service"],
        }
}

class proftpd::service {
        service { "proftpd":
                        ensure     => running,
                        hasstatus  => true,
                        hasrestart => true,
                        enable     => true,
                        require    => Class["proftpd::config"],
        }
}

class proftpd {
        include proftpd::repo, proftpd::install, proftpd::config, proftpd::service
}
