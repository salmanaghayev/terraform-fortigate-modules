# Output just the names of the firewall services
output "fortios_firewall_address_name" {
  description = "A list of all firewall address names"
  value       = [for address in fortios_firewall_address.firewall_address : address.name]
}
