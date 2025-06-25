
# Define variables for firewall policies with example data as default
variable "firewall_policies" {
  description = "A map of firewall policies with key-value pairs for each policy"
  type = map(object({
    name                = string
    src_intf            = string
    dst_intf            = string
    src_addr            = list(string)
    dst_addr            = list(string)
    action              = string
    schedule            = optional(string)
    service             = list(string)
    utm_status          = optional(string, "enable")
    application_list    = optional(string)
    av_profile          = optional(string)
    dnsfilter_profile   = optional(string)
    file_filter_profile = optional(string)
    ips_sensor          = optional(string)
    ssl_ssh_profile     = optional(string)
    webfilter_profile   = optional(string)
    logtraffic          = string
    comments            = optional(string)
  }))
  # default = null
}
