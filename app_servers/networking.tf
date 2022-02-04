# Imported Resource Group
resource "azurerm_resource_group" "guru" {
  #name     = var.rg_name
  #location = var.location
  #tags     = var.tags
}

# Creates a random string of characters for the fqdn
resource "random_string" "guru-fqdn" {
 length  = 6
 special = false
 upper   = false
 number  = false
}

# Creates Azure Virtual Network
resource "azurerm_virtual_network" "guru-vn" {
  name                = "guru-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.guru.location
  resource_group_name = azurerm_resource_group.guru.name
  tags                = var.tags
}

# Creates Azure Subnet
resource "azurerm_subnet" "guru-sub" {
  name                 = "guru-subnet"
  resource_group_name  = azurerm_resource_group.guru.name
  virtual_network_name = azurerm_virtual_network.guru-vn.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Azure Public IP
resource "azurerm_public_ip" "guru-pubip" {
  name                = "publicIPForLB"
  location            = azurerm_resource_group.guru.location
  resource_group_name = azurerm_resource_group.guru.name
  allocation_method   = "Static"
  domain_name_label   = random_string.guru-fqdn.result
  sku                 = "Standard"
  tags                = var.tags
}
