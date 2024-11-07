# Output all firewall services created with their details
output "firewall_services" {
  description = "A map of all firewall services with their details"
  value = {
    for name, service in fortios_firewallservice_custom.firewall_service :
    name => {
      name           = service.name
      protocol       = service.protocol
      tcp_portrange  = service.tcp_portrange
      udp_portrange  = service.udp_portrange
      sctp_portrange = service.sctp_portrange
    }
  }
}

# Output just the names of the firewall services
output "firewall_service_names" {
  description = "A list of all firewall service names"
  value       = [for service in fortios_firewallservice_custom.firewall_service : service.name]
}

# Output the protocols of each firewall service
output "firewall_service_protocols" {
  description = "A map of firewall service names to their protocols"
  value = {
    for name, service in fortios_firewallservice_custom.firewall_service :
    name => service.protocol
  }
}
