# Local variable to hold firewall addresses, defaulting to an empty map if null
locals {

  firewall_services = {

    "Service-1" = {
      tcp_portrange = "880"
    },

    "Service-2" = {
      tcp_portrange = "4443"
    },

    "HTTP-custom" = {
      tcp_portrange = "80"
    },

    "DIfferent-protocol-custom" = {
      protocol = "IP"
      # color    = "5"
      comment = "test-comment"
    }
  }
}
