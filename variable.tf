variable "location" {
  description = "Azure region for NSG deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group where NSGs will be deployed"
  type        = string
}

variable "tags" {
  description = "Tags for the NSG"
  type        = map(string)
  default     = {}
}

variable "nsgs" {
  description = "Map of NSGs to create"
  type = map(object({
    location            = string
    resource_group_name = string
  }))
  default = {}
}

variable "nsg_rules" {
  description = "List of security rules for each NSG"
  type = list(object({
    nsg_name                = string
    name                    = string
    priority                = number
    direction               = string
    access                  = string
    protocol                = string
    source_port_range       = string
    destination_port_range  = string
    source_address_prefix   = string
    destination_address_prefix = string
  }))
  default = []
}
