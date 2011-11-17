class httpd::service($enable = true) {
    service { "httpd":
        ensure  => $enable,
        require => Class["httpd::config"],
    }
}
