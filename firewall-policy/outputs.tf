
output "firewall_policy" {
  description = "A map of all firewall policies' with their details"
  value = {
    for name, policy in fortios_firewall_policy.firewall_policy :
    name => {
      name     = policy.name
      id       = policy.id
      src_addr = policy.src_addr
      dst_addr = policy.dst_addr
    }
  }
}
