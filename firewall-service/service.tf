
terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

resource "fortios_firewallservice_category" "firewall_service_category" {
  name = "Custom Services Created by Terraform"
}

# Resource to create custom firewall services using for_each
resource "fortios_firewallservice_custom" "firewall_service" {
  for_each = var.firewall_services

  name           = each.value["name"]
  protocol       = lookup(each.value, "protocol", "TCP/UDP/SCTP")
  comment        = lookup(each.value, "comment", "managed-by-terraform")
  tcp_portrange  = lookup(each.value, "tcp_portrange", null)
  udp_portrange  = lookup(each.value, "udp_portrange", null)
  sctp_portrange = lookup(each.value, "sctp_portrange", null)
  category       = lookup(each.value, "category", "Custom Services Created by Terraform")

  depends_on = [fortios_firewallservice_category.firewall_service_category]
}


