# Creates the load balancer for our app servers
resource "azurerm_lb" "guru" {
  name                = "guru-lb"
  location            = azurerm_resource_group.guru.location
  resource_group_name = azurerm_resource_group.guru.name

  frontend_ip_configuration {
    name                 = "publicIPAddress"
    public_ip_address_id = azurerm_public_ip.guru-pubip.id
  }
  tags = var.tags
}

# Creates the backend address pool for our load balancer
resource "azurerm_lb_backend_address_pool" "guru" {
  loadbalancer_id     = azurerm_lb.guru.id
  name                = "BackEndAddressPool"
}

# Creates the probe for the load balancer
resource "azurerm_lb_probe" "guru" {
  resource_group_name = azurerm_resource_group.guru.name
  loadbalancer_id     = azurerm_lb.guru.id
  name                = "ssh-running-probe"
  port                = var.application_port
}

# Creates the rules for the load balancer
resource "azurerm_lb_rule" "guru" {
   resource_group_name            = azurerm_resource_group.guru.name
   loadbalancer_id                = azurerm_lb.guru.id
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = var.application_port
   backend_port                   = var.application_port
   backend_address_pool_id        = azurerm_lb_backend_address_pool.guru.id
   frontend_ip_configuration_name = azurerm_lb.guru.frontend_ip_configuration[0].name
   #frontend_ip_configuration_name = "PublicIPAddress"
   probe_id                       = azurerm_lb_probe.guru.id
}
