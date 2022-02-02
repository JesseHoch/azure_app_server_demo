# Information that outputs to the console after the apply or output command is run
output "resource_group_name" {
  value = azurerm_resource_group.guru.name
}

output "location" {
  value = azurerm_resource_group.guru.location
}

output "web_servers" {
  value = azurerm_virtual_machine.guru.*.id
}

output "public_ip_address" {
  value       = azurerm_public_ip.guru.fqdn
}