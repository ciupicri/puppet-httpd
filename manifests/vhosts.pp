class httpd::vhosts inherits httpd {
    Config_file {
        require => Class["httpd::install"],
        notify  => Class["httpd::service"],
    }

    config_file { "/etc/httpd/vhosts.d":
        source  => "/etc/httpd/vhosts.d",
        recurse => inf,
    }
}
