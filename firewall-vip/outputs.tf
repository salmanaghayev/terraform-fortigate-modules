
# Output just the names of the firewall vips
output "firewall_vip_names" {
  description = "A list of all firewall vip/dnat names"
  value       = [for vip in fortios_firewall_vip.firewall_vip : vip.name]
}
