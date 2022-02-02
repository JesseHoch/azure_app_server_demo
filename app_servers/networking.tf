# Imported Resource Group
resource "azurerm_resource_group" "guru" {
  #name     = "<RESOURCE_GROUP_NAME>"
  #location = "<LOCATION>"
  #tags     = var.tags
}

# Creates a random string of characters for the fqdn
#resource "random_string" "guru-fqdn" {
# length  = 6
# special = false
# upper   = false
# number  = false
#}

# Creates Azure Virtual Network
#resource "azurerm_virtual_network" "guru-vn" {
#  name                = "guru-network"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name
#  tags                = var.tags
#}

# Creates Azure Subnet
#resource "azurerm_subnet" "guru-sub" {
#  name                 = "guru-subnet"
#  location             = azurerm_resource_group.guru.location
#  resource_group_name  = azurerm_resource_group.guru.name
#  virtual_network_name = azurerm_virtual_network.guru.name
#  address_prefixes     = ["10.0.2.0/24"]
#  tags                 = var.tags
#}

# Create Azure Public IP
#resource "azurerm_public_ip" "guru-pubip" {
#  name                = "publicIPForLB"
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name
#  allocation_method   = "Static"
#  domain_name_label   = random_string.fqdn.result
#  tags                = var.tags
#}

# Create Azure Network Interface (NIC)
#resource "azurerm_network_interface" "guru-nic" {
#  count               = 2
#  name                = "AZ-VM-00-NIC-${count.index}"
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name

#  ip_configuration {
#    name                          = "guru-config"
#    subnet_id                     = azurerm_subnet.guru.id
#    private_ip_address_allocation = "Dynamic"
#  }
#  tags = var.tags
#}
