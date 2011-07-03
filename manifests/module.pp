class httpd::module($module) {
    package { "mod_$module":
        ensure  => installed,
        require => Class["httpd::install"],
        notify  => Class["httpd::service"],
    }
}

