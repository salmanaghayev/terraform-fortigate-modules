# Terraform FortiGate Modules

This repository contains Terraform modules for managing FortiGate firewall configurations. The modules are designed to help you manage firewall addresses, address groups, policies, and services in a structured and maintainable way.

## Modules

### 1. Firewall Address Module (`firewall-address/`)
Manages firewall address objects in FortiGate. Supports:
- IP/Mask
- FQDN
- Geography-based addresses

**Input:**
- `firewall_addresses` (map): A map of address objects. See the [examples](./examples) for structure.

### 2. Firewall Address Group Module (`firewall-addrgrp/`)
Manages address groups in FortiGate. Supports:
- Grouping multiple address objects
- Comments and metadata for groups

**Input:**
- `firewall_addrgrps` (map): A map of address group objects. See the [examples](./examples) for structure.

### 3. Firewall Policy Module (`firewall-policy/`)
Manages firewall policies in FortiGate. Supports:
- Source/destination interfaces
- Source/destination addresses
- Services
- Action and logging settings

**Input:**
- `firewall_policies` (map): A map of policy objects. See the [examples](./examples) for structure.

### 4. Firewall Service Module (`firewall-service/`)
Manages custom firewall services in FortiGate. Supports:
- TCP, UDP, SCTP services
- Custom service categories

**Input:**
- `firewall_services` (map): A map of service objects. See the [examples](./examples) for structure.

## Example Usage

A complete example is provided in the [`examples/`](./examples) directory. Each module is configured using a map variable defined in a separate file. The main configuration (`main.tf`) includes all modules and the provider.

**Example structure:**
- `main.tf` – Provider and module blocks
- `address-vars.tf` – Locals map for addresses
- `service-vars.tf` – Locals map for services
- `policy-vars.tf` – Locals map for policies
- `address-groups-vars.tf` – Locals map for address groups

**Example main.tf:**
```hcl
provider "fortios" {
  hostname     = var.fortigate_hostname
  token        = var.fortigate_token
  insecure     = false
  vdom         = "terraform"
  cabundlefile = var.ca_bundle_file
}

module "firewall_address" {
  source = "../firewall-address"
  firewall_addresses = local.firewall_addresses
}

module "firewall_addrgrp" {
  source = "../firewall-addrgrp"
  firewall_addrgrps = local.firewall_addrgrps
  depends_on = [module.firewall_address]
}

module "firewall_service" {
  source = "../firewall-service"
  firewall_services = local.firewall_services
}

module "firewall_policy" {
  source = "../firewall-policy"
  firewall_policies = local.firewall_policies
  depends_on = [module.firewall_service, module.firewall_address]
}
```

**See the [`examples/`](./examples) directory for full working code.**

## Requirements
- Terraform >= 0.13
- FortiOS Provider (fortinetdev/fortios)

## Best Practices
1. Use meaningful names and comments for your resources
2. Implement proper security measures for API tokens
3. Use variables for sensitive information
4. Implement proper state management
5. Use version control for your Terraform configurations

## Contributing
Feel free to submit issues and enhancement requests.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
