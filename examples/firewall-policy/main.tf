provider "fortios" {
  hostname = var.fortigate_hostname
  token    = var.fortigate_token
  insecure = true # Set to false in production
}

module "firewall_policy" {
  source = "../../firewall-policy"

  firewall_policies = {
    # Basic internet access policy
    "internet-access" = {
      name       = "internet-access"
      action     = "accept"
      src_intf   = "internal"
      dst_intf   = "wan1"
      src_addr   = ["internal-network"]
      dst_addr   = ["all"]
      service    = ["ALL"]
      logtraffic = "all"
      comments   = "Allow internal network to access internet"
    }

    # DMZ to internal policy
    "dmz-to-internal" = {
      name       = "dmz-to-internal"
      action     = "accept"
      src_intf   = "dmz"
      dst_intf   = "internal"
      src_addr   = ["dmz-servers"]
      dst_addr   = ["internal-network"]
      service    = ["HTTP", "HTTPS"]
      logtraffic = "all"
      comments   = "Allow DMZ servers to access internal network via HTTP/HTTPS"
    }

    # Block specific traffic
    "block-malicious" = {
      name       = "block-malicious"
      action     = "deny"
      src_intf   = "any"
      dst_intf   = "any"
      src_addr   = ["malicious-ips"]
      dst_addr   = ["all"]
      service    = ["ALL"]
      logtraffic = "all"
      comments   = "Block known malicious IPs"
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
