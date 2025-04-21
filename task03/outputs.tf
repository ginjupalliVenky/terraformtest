output "rg_id" {
  value = azurerm_resource_group.this.id
  description = "rg name"
}

output "sa_blob_endpoint" {
  value = azurerm_storage_account.this.primary_blob_endpoint
  description = "sa enpoint"
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
  description = "vnet id"
}