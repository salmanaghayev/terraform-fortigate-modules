# Define variables for firewall addresses with example data as default
variable "firewall_addresses" {
  description = "A map of firewall addresses with key-value pairs for each address"
  type        = map(map(string))
  default     = null
}
