# good for proxies
class httpd::config::selinux::can_network_connect {
    selboolean { "httpd_can_network_connect":
        value => on,
    }
}
