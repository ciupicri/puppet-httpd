class httpd::service {
    service { "httpd":
        ensure  => running,
        require => Class["httpd::config"],
    }
}
