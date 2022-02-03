# Output the Storage Account Name and Storage Container Name used in The Backend setup.
output "storage_account_name" {
  value = azurerm_storage_account.tfstate.name
}

output "storage_container_name" {
  value = azurerm_storage_container.tfstate.name
}
