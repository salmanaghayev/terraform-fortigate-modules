

# Define variables for custom firewall vips with example data as default
variable "firewall_vips" {
  description = "A map of custom firewall vips with key-value pairs for each vip/dnat"
  type = map(object({
    name      = string
    comment   = optional(string, "Managed by Terraform")
    color     = optional(string, "20")
    extintf   = string
    extip     = string
    mappedips = list(string)

  }))


  default = null
}


