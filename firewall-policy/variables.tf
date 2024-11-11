
# Define variables for firewall policies with example data as default
variable "firewall_policies" {
  description = "A map of firewall policies with key-value pairs for each policy"
  type = map(object({
    name       = string
    src_intf   = string
    dst_intf   = string
    src_addr   = list(string)
    dst_addr   = list(string)
    action     = string
    schedule   = string
    service    = list(string)
    logtraffic = string
    comments   = string
  }))
  default = null
}
