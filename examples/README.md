# FortiGate Terraform Module Examples

This directory contains example configurations for the FortiGate Terraform modules. The examples demonstrate how to use all modules together in a single firewall configuration.

> **Naming Convention Note:**
> 
> FortiGate firewalls are sensitive to object names. When referencing addresses, address groups, VIPs, or services in your firewall policies, you must use the exact same names as defined in your `address-vars.tf`, `address-groups-vars.tf`, `vip-vars.tf`, and `service-vars.tf` files. For example, if you define a VIP or service as `"web-vip"` in `vip-vars.tf`, you must reference `"web-vip"` by that exact name in your `policy-vars.tf` file. Consistent naming is required for all cross-references between addresses, address groups, VIPs, services, and policies.

## File Structure

- `main.tf` - Provider configuration and module declarations
- `address-vars.tf` - Locals map for firewall addresses
- `service-vars.tf` - Locals map for firewall services
- `policy-vars.tf` - Locals map for firewall policies
- `address-groups-vars.tf` - Locals map for firewall address groups
- `vip-vars.tf` - Locals map for firewall VIP/DNAT objects

## Configuration Structure

Each configuration type is defined in its own file using a `locals` block. The main configuration (`main.tf`) loads these maps and passes them to the respective modules.

### Example main.tf
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

module "firewall_vip" {
  source = "../firewall-vip"
  firewall_vips = local.firewall_vips
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

### Example address-vars.tf
```hcl
locals {
  firewall_addresses = {
    # ... address objects ...
  }
}
```

### Example service-vars.tf
```hcl
locals {
  firewall_services = {
    # ... service objects ...
  }
}
```

### Example policy-vars.tf
```hcl
locals {
  firewall_policies = {
    "web-policy" = {
      name                = "web-policy"
      src_intf            = "port1"
      dst_intf            = "port2"
      src_addr            = ["all"]
      dst_addr            = ["all"]
      service             = ["HTTP", "HTTPS"]
      action              = "accept"
      schedule            = "always"
      utm_status          = "enable"
      av_profile          = "default"
      webfilter_profile   = "default"
      logtraffic          = "all"
      comments            = "Allow web traffic with UTM profiles"
    }
  }
}
```

### Example address-groups-vars.tf
```hcl
locals {
  firewall_addrgrps = {
    # ... address group objects ...
  }
}
```

### Example vip-vars.tf
```hcl
locals {
  firewall_vips = {
    # "web-vip" = {
    #   name           = "web-vip"
    #   type           = "static-nat"
    #   extip          = "203.0.113.10"
    #   mappedip       = "192.168.1.10"
    #   extintf        = "wan1"
    #   portforward    = false
    #   comment        = "Web server DNAT"
    # }
  }
}
```

## Usage

1. Create a `terraform.tfvars` file with your FortiGate credentials:
   ```hcl
   fortigate_hostname = "your-fortigate-hostname"
   fortigate_token    = "your-api-token"
   ca_bundle_file     = "./Fortinet_CA_SSL.crt"
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the planned changes:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration Examples

### Firewall Services (services.tf)
- Custom TCP services (e.g., web ports 8080, 8443)
- Custom UDP services (e.g., DNS port 5353)
- ICMP services

### Firewall Addresses (addresses.tf)
- Single IP addresses (e.g., h-192.168.1.11/32)
- FQDN addresses (e.g., dns.google)
- Geography-based addresses (e.g., CA locations)

### Firewall Address Groups (address-groups-vars.tf)
- Web servers group
- External servers group

### Firewall Policies (policies.tf)
- Web access policies
- DNS access policies
- Security policies (block malicious traffic)

## Security Notes

1. Never commit sensitive information like API tokens to version control
2. Use environment variables for sensitive data:
   ```bash
   export FORTIOS_ACCESS_HOSTNAME="your-fortigate-hostname"
   export FORTIOS_ACCESS_TOKEN="your-api-token"
   export FORTIOS_INSECURE="false"
   export FORTIOS_CA_CABUNDLE="/path/to/yourCA.crt"
   ```
3. Always set `insecure = false` in production environments
4. Use proper SSL certificate verification with CA bundle
5. Review and adjust the example configurations according to your security requirements
6. Use VDOM (Virtual Domain) for better resource isolation

## Additional Resources

- [FortiGate Terraform Provider Documentation](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs)
- [FortiGate REST API Documentation](https://fndn.fortinet.net/)
- [FortiGate VDOM Documentation](https://docs.fortinet.com/document/fortigate/7.0.0/administration-guide/71273/virtual-domains) 