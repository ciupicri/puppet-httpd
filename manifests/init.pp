class httpd($enable = true, $virtualhosting = false) {
    include install
    class { "config": virtualhosting => $virtualhosting }
    class { "service": enable => $enable }
}
