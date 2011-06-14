class httpd::install {
    package { "httpd":
        ensure => installed,
    }
}

# good for proxies
class httpd::config::selinux::can_network_connect {
    selboolean { "httpd_can_network_connect":
        value => on,
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

class httpd::wsgi inherits httpd {
    package { "mod_wsgi":
        ensure => installed,
    }
}
