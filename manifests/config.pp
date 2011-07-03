class httpd::config {
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
}
