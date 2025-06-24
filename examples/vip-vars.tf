# Local variable to hold firewall vips, defaulting to an empty map if null
locals {

  firewall_vips = {

    vip1 = {
      extintf   = "VLAN40"
      extip     = "192.168.44.20"
      name      = "mip-192.168.44.20"
      type      = "static-nat"
      mappedips = ["142.148.45.20"]
    },

    vip2 = {
      extintf   = "VLAN40"
      extip     = "192.168.44.21"
      name      = "mip-192.168.44.21"
      type      = "static-nat"
      mappedips = ["142.148.45.21"]
    },

    vip3 = {
      extintf   = "VLAN40"
      extip     = "192.168.44.22"
      name      = "mip-192.168.44.22"
      type      = "static-nat"
      mappedips = ["142.148.45.22"]
    },

    vip4 = {
      extintf   = "VLAN40"
      extip     = "192.168.44.23"
      name      = "mip-192.168.44.23"
      type      = "static-nat"
      mappedips = ["142.148.45.23"]
    }

  }



}
