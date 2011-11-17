class httpd::config($virtualhosting = false) {
    Config_file {
        require => Class["httpd::install"],
        notify  => Class["httpd::service"],
    }

    config_file {
        "/etc/httpd/conf/httpd.conf":
            source  => "/etc/httpd/conf/httpd.conf";
        "/etc/sysconfig/httpd":
            source  => "/etc/sysconfig/httpd";
    }

    if ($virtualhosting) {
        config_file { "/etc/httpd/vhosts.d":
            source  => "/etc/httpd/vhosts.d",
            recurse => inf,
        }
    }
}
