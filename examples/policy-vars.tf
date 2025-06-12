locals {
  firewall_policies = {
    "policy1" = {
      name       = "Allow_Web_Server_to_Google_DNS"
      src_intf   = "any" #"UnTrust-Dev"
      dst_intf   = "any" #"Trust-Dev"
      src_addr   = ["all"]
      dst_addr   = ["h-192.168.1.11-32", "h-142.148.10.120"]
      action     = "deny" #"accept"
      schedule   = "always"
      service    = ["Service-1"]
      logtraffic = "all"
      comments   = "test"
    },
    "allow-web" = {
      name       = "allow-web"
      src_intf   = "port1"
      dst_intf   = "port2"
      src_addr   = ["all"]
      dst_addr   = ["all"]
      service    = ["ALL"]
      action     = "accept"
      logtraffic = "all"
      # comments   = "Allow web traffic"
    }
  }
}
