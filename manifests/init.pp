class httpd {
    package { "httpd":
        ensure => installed,
    }

    config_file { "/etc/httpd/conf/httpd.conf":
        source => "/etc/httpd/conf/httpd.conf",
    }

    service { "httpd":
        ensure => running,
    }

    Package["httpd"] -> Config_file["/etc/httpd/conf/httpd.conf"] ~> Service["httpd"]
}
