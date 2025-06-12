provider "fortios" {
  hostname = var.fortigate_hostname
  token    = var.fortigate_token
  insecure = true # Set to false in production
}

module "firewall_service" {
  source = "../../firewall-service"

  firewall_services = {
    # Custom TCP service
    "custom-web" = {
      name          = "custom-web"
      protocol      = "TCP/UDP/SCTP"
      tcp_portrange = "8080,8443"
      comment       = "Custom web application ports"
    }

    # Custom UDP service
    "custom-dns" = {
      name          = "custom-dns"
      protocol      = "TCP/UDP/SCTP"
      udp_portrange = "5353"
      comment       = "Custom DNS service"
    }

    # ICMP service
    "custom-icmp" = {
      name     = "custom-icmp"
      protocol = "ICMP"
      icmptype = "8"
      comment  = "Custom ICMP echo request"
    }

    # SCTP service
    "custom-sctp" = {
      name           = "custom-sctp"
      protocol       = "TCP/UDP/SCTP"
      sctp_portrange = "2905"
      comment        = "Custom SCTP service"
    }
  }
}

# Variables
variable "fortigate_hostname" {
  description = "FortiGate hostname or IP address"
  type        = string
}

variable "fortigate_token" {
  description = "FortiGate API token"
  type        = string
  sensitive   = true
} 
