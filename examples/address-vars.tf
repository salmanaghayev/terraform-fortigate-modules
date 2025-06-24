locals {
  firewall_addresses = {

    "h-192.168.1.10" = {
      name   = "h-192.168.1.11-32"
      type   = "ipmask"
      subnet = "192.168.1.11/32"
    },
    "google_dns" = {
      name = "Google_DNS"
      type = "fqdn"
      fqdn = "dns.google"
    },
    "us_locations" = {
      name    = "CA_locations"
      type    = "geography"
      country = "CA"
    },

    "h-192.168.1.12-1" = {
      name   = "h-192.168.1.12-1"
      type   = "ipmask"
      subnet = "192.168.1.12/32"
    }
  }
}
