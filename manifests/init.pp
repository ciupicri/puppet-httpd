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

    config_file {
        "/etc/httpd/conf/httpd.conf":
            source  => "/etc/httpd/conf/httpd.conf";
        "/etc/sysconfig/httpd":
            source  => "/etc/sysconfig/httpd";
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

class httpd::module($module) {
    package { "mod_$module":
        ensure  => installed,
        require => Class["install"],
        notify  => Class["service"],
    }
}
