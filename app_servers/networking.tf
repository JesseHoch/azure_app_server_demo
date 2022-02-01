resource "azurerm_resource_group" "guru" {
  #name     = "<RESOURCE_GROUP_NAME>"
  #location = "<LOCATION>"
}

#resource "azurerm_virtual_network" "guru" {
#  name                = "guru-network"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name
#}
#resource "azurerm_subnet" "guru" {
#  name                 = "guru-subnet"
#  resource_group_name  = azurerm_resource_group.guru.name
#  virtual_network_name = azurerm_virtual_network.guru.name
#  address_prefixes     = ["10.0.2.0/24"]
#}

#resource "azurerm_public_ip" "guru" {
#  name                = "publicIPForLB"
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name
#  allocation_method   = "Static"
#}

#resource "azurerm_network_interface" "guru" {
#  count               = 2
#  name                = "AZ-VM-00-NIC-${count.index}"
#  location            = azurerm_resource_group.guru.location
#  resource_group_name = azurerm_resource_group.guru.name

#  ip_configuration {
#    name                          = "guru-config"
#    subnet_id                     = azurerm_subnet.guru.id
#    private_ip_address_allocation = "Dynamic"
#  }
#}