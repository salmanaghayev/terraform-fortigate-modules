provider "fortios" {
  hostname = var.fortigate_hostname
  token    = var.fortigate_token
  insecure = true # Set to false in production
}

module "firewall_address" {
  source = "../../firewall-address"

  firewall_addresses = {
    # IP/Mask address
    "internal-network" = {
      name    = "internal-network"
      type    = "ipmask"
      subnet  = "192.168.1.0/24"
      comment = "Internal network range"
    }

    # FQDN address
    "google-dns" = {
      name    = "google-dns"
      type    = "fqdn"
      fqdn    = "dns.google"
      comment = "Google DNS servers"
    }

    # Geography-based address
    "us-servers" = {
      name    = "us-servers"
      type    = "geography"
      country = "US"
      comment = "US-based servers"
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
