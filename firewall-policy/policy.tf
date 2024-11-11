terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}

# Resource to create firewall policies using for_each
resource "fortios_firewall_policy" "firewall_policy" {
  for_each = var.firewall_policies

  name       = each.value.name
  action     = each.value.action
  schedule   = each.value.schedule
  logtraffic = each.value.logtraffic
  comments   = lookup(each.value, "comments", "comment added by Terraform")

  # Define source and destination interface blocks
  dynamic "srcintf" {
    for_each = [each.value.src_intf]
    content {
      name = srcintf.value
    }
  }

  dynamic "dstintf" {
    for_each = [each.value.dst_intf]
    content {
      name = dstintf.value
    }
  }

  # Define source and destination address blocks
  dynamic "srcaddr" {
    for_each = each.value.src_addr
    content {
      name = srcaddr.value
    }
  }

  dynamic "dstaddr" {
    for_each = each.value.dst_addr
    content {
      name = dstaddr.value
    }
  }

  # Define service blocks referencing the created firewall services
  dynamic "service" {
    for_each = each.value.service
    content {
      name = service.value
    }
  }
}
