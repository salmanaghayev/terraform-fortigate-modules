# FortiGate Terraform Module Examples

This directory contains example configurations for the FortiGate Terraform modules. Each example demonstrates different use cases and configurations for the modules.

## Directory Structure

- `firewall-address/` - Examples for managing firewall address objects
- `firewall-policy/` - Examples for managing firewall policies
- `firewall-service/` - Examples for managing custom firewall services

## Usage

1. Navigate to the example directory you want to use:
   ```bash
   cd firewall-address  # or firewall-policy or firewall-service
   ```

2. Create a `terraform.tfvars` file with your FortiGate credentials:
   ```hcl
   fortigate_hostname = "your-fortigate-hostname"
   fortigate_token    = "your-api-token"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the planned changes:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Example Configurations

### Firewall Address Examples
- IP/Mask address configuration
- FQDN address configuration
- Geography-based address configuration

### Firewall Policy Examples
- Basic internet access policy
- DMZ to internal network policy
- Block malicious traffic policy

### Firewall Service Examples
- Custom TCP service
- Custom UDP service
- ICMP service
- SCTP service

## Security Notes

1. Never commit sensitive information like API tokens to version control
2. Use environment variables or secure secret management for sensitive data
3. Set `insecure = false` in production environments
4. Review and adjust the example configurations according to your security requirements

## Additional Resources

- [FortiGate Terraform Provider Documentation](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs)
- [FortiGate REST API Documentation](https://fndn.fortinet.net/) 