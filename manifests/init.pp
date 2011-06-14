class httpd::install {
    package { "httpd":
        ensure => installed,
    }
}

class httpd::config {
    Config_file {
        require => Class["install"],
        notify  => Class["service"],
    }

    config_file { "/etc/httpd/conf/httpd.conf":
        source  => "/etc/httpd/conf/httpd.conf",
    }
}

class httpd::service {
    service { "httpd":
        ensure  => running,
        require => Class["config"],
    }
}

class httpd {
    include install, config, service
}
