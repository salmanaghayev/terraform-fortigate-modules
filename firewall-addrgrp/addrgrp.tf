terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

# Resource to create firewall address groups
resource "fortios_firewall_addrgrp" "firewall_addrgrp" {
  for_each = var.firewall_addrgrps

  name    = each.value.name
  comment = each.value.comment
  color   = each.value.color

  dynamic "member" {
    for_each = each.value.members
    content {
      name = member.value
    }
  }
}
