terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
  hostname     = var.fortigate_hostname
  token        = var.fortigate_token
  insecure     = false
  vdom         = "terraform"
  cabundlefile = var.ca_bundle_file
}

# Firewall Services Module
module "fortigate_services" {
  source = "../firewall-service"

  firewall_services = local.firewall_services
}

# Firewall Address Module
module "fortigate_address" {
  source = "../firewall-address"

  firewall_addresses = local.firewall_addresses
}

# Firewall Address Group Module
module "fortigate_address_grp" {
  source = "../firewall-addrgrp"

  firewall_addrgrps = local.firewall_addrgrps
  depends_on        = [module.fortigate_address]
}

# Firewall Policy Module
module "fortigate_policy" {
  source = "../firewall-policy"

  firewall_policies = local.firewall_policies
  depends_on        = [module.fortigate_services, module.fortigate_address]
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

variable "ca_bundle_file" {
  description = "Path to the CA bundle file for SSL verification"
  type        = string
  default     = "./Fortinet_CA_SSL.crt"
}
