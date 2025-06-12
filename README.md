# Terraform FortiGate Modules

This repository contains Terraform modules for managing FortiGate firewall configurations. The modules are designed to help you manage firewall addresses, policies, and services in a structured and maintainable way.

## Modules

### 1. Firewall Address Module (`firewall-address/`)

This module manages firewall address objects in FortiGate. It supports different types of addresses including:
- IP/Mask
- FQDN
- Geography-based addresses

#### Usage
```hcl
module "firewall_address" {
  source = "./firewall-address"

  firewall_addresses = {
    "example-ip" = {
      name    = "example-ip"
      type    = "ipmask"
      subnet  = "192.168.1.0/24"
      comment = "Example IP range"
    }
  }
}
```

### 2. Firewall Policy Module (`firewall-policy/`)

This module manages firewall policies in FortiGate. It allows you to create and manage:
- Source and destination interfaces
- Source and destination addresses
- Services
- Action and logging settings

#### Usage
```hcl
module "firewall_policy" {
  source = "./firewall-policy"

  firewall_policies = {
    "example-policy" = {
      name       = "example-policy"
      action     = "accept"
      src_intf   = "port1"
      dst_intf   = "port2"
      src_addr   = ["all"]
      dst_addr   = ["all"]
      service    = ["ALL"]
      logtraffic = "all"
    }
  }
}
```

### 3. Firewall Service Module (`firewall-service/`)

This module manages custom firewall services in FortiGate. It supports:
- TCP services
- UDP services
- SCTP services
- Custom service categories

#### Usage
```hcl
module "firewall_service" {
  source = "./firewall-service"

  firewall_services = {
    "custom-tcp-service" = {
      protocol      = "TCP/UDP/SCTP"
      tcp_portrange = "80,443"
      comment       = "Custom web services"
    }
  }
}
```

## Requirements

- Terraform >= 0.13
- FortiOS Provider (fortinetdev/fortios)

## Provider Configuration

```hcl
provider "fortios" {
  hostname = "your-fortigate-hostname"
  token    = "your-api-token"
  insecure = true  # Set to false in production
}
```

## Dependencies

The modules use the official FortiOS provider from Fortinet:
```hcl
terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}
```

## Best Practices

1. Always use meaningful names and comments for your resources
2. Implement proper security measures when handling API tokens
3. Use variables for sensitive information
4. Implement proper state management
5. Use version control for your Terraform configurations

## Contributing

Feel free to submit issues and enhancement requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
