output "nsg_ids" {
  description = "Map of created NSG IDs"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}
