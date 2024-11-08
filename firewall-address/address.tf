terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}


# Resource to create firewall addresses using for_each
resource "fortios_firewall_address" "firewall_address" {
  for_each = var.firewall_addresses

  name    = each.value["name"]
  type    = each.value["type"]
  comment = lookup(each.value, "comment", "Managed by Terraform")

  # Set attributes conditionally based on the type
  subnet  = each.value["type"] == "ipmask" ? lookup(each.value, "subnet", null) : null
  fqdn    = each.value["type"] == "fqdn" ? lookup(each.value, "fqdn", null) : null
  country = each.value["type"] == "geography" ? lookup(each.value, "country", null) : null

  #   lifecycle {
  #     create_before_destroy = true
  #   }
}
