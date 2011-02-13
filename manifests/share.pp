define httpd::share($ensure = present, $directory) {
    file {"/etc/httpd/conf.d/share-${name}.conf":
        ensure  => $ensure,
        content => template("httpd/share.conf.erb"),
        notify  => Class["httpd::service"],
    }
}
