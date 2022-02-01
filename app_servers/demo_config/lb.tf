resource "azurerm_lb" "guru" {
  name                = "loadBalancer"
  location            = azurerm_resource_group.guru.location
  resource_group_name = azurerm_resource_group.guru.name

  frontend_ip_configuration {
    name                 = "publicIPAddress"
    public_ip_address_id = azurerm_public_ip.guru.id
  }
}

resource "azurerm_lb_backend_address_pool" "guru" {
  loadbalancer_id = azurerm_lb.guru.id
  name            = "BackEndAddressPool"
}