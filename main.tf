resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "rules" {
  for_each                     = { for k, v in var.nsg_rules : k => v if contains(keys(var.nsgs), v.nsg_name) }
  network_security_group_name   = azurerm_network_security_group.nsg[each.value.nsg_name].name
  resource_group_name           = var.resource_group_name
  name                          = each.value.name
  priority                      = each.value.priority
  direction                     = each.value.direction
  access                        = each.value.access
  protocol                      = each.value.protocol
  source_port_range             = each.value.source_port_range
  destination_port_range        = each.value.destination_port_range
  source_address_prefix         = each.value.source_address_prefix
  destination_address_prefix    = each.value.destination_address_prefix
}
