# Output just the names of the firewall services
output "fortios_firewall_address_name" {
  description = "A list of all firewall address names"
  value       = [for addresses in fortios_firewall_address_name.firewall_addresses : address.name]
}
