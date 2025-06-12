# Define variables for firewall address groups
variable "firewall_addrgrps" {
  description = "A map of firewall address groups"
  type = map(object({
    name    = string
    comment = optional(string, "Managed by Terraform")
    color   = optional(string, "20")
    members = list(string) # List of firewall address names
  }))
  default = {}
}
