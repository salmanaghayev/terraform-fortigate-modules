

# Define variables for custom firewall services with example data as default
variable "firewall_services" {
  description = "A map of custom firewall services with key-value pairs for each service"
  type = map(object({
    name          = string
    protocol      = optional(string)
    tcp_portrange = optional(string) # Optional TCP port range
    udp_portrange = optional(string) # Optional UDP port range
  }))
  default = null
}
