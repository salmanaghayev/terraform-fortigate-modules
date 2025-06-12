locals {
  firewall_addrgrps = {

    group1 = {
      name    = "WebServices"
      members = ["h-192.168.1.11-32", "h-192.168.1.12-1"]
      #  comment = "Group for web services"
    }

  }
}
