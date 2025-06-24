locals {
  firewall_addrgrps = {
    "web-servers" = {
      name    = "web-servers"
      members = ["h-192.168.1.11-32", "h-192.168.1.12-1"]
      comment = "Group of web servers"
    },

    "external-servers" = {
      name    = "external-servers"
      members = ["h-192.168.1.12-1", "Google_DNS"]
      comment = "External servers group"
    }
  }
}
