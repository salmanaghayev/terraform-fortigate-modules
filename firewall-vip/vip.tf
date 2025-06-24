
terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}



# Resource to create firewall VIP/DNAT using for_each
resource "fortios_firewall_vip" "firewall_vip" {
  for_each = var.firewall_vips

  name    = each.value.name
  color   = each.value.color
  extintf = each.value.extintf
  extip   = each.value.extip
  comment = each.value.comment

  dynamic "mappedip" {
    for_each = each.value.mappedips
    content {
      range = mappedip.value
    }

  }
}



