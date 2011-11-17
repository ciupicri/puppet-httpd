class httpd($virtualhosting = false) {
    include install, service
    class { "config": virtualhosting => $virtualhosting }
}
