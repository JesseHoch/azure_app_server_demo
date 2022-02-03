# Creates the Virtual Machine scale set to create our VMs
resource "azurerm_virtual_machine_scale_set" "guru" {
 name                = var.azurerm_virtual_machine_scale_set
 location            = azurerm_resource_group.guru.location
 resource_group_name = azurerm_resource_group.guru.name
 upgrade_policy_mode = "Manual"

 zones = local.zones

 sku {
   name     = "Standard_DS1_v2"
   tier     = "Standard"
   capacity = 2
 }

 storage_profile_image_reference {
   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"
 }

 storage_profile_os_disk {
   name              = ""
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }

 storage_profile_data_disk {
   lun          = 0
   caching        = "ReadWrite"
   create_option  = "Empty"
   disk_size_gb   = 10
 }

 os_profile {
   computer_name_prefix = "vmlab"
   admin_username       = var.admin_username
   admin_password       = var.admin_password
   custom_data          = file("web.conf")
 }

 os_profile_linux_config {
   disable_password_authentication = false
 }

 network_profile {
   name    = "gurunetworkprofile"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = azurerm_subnet.guru-sub.id
     load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.guru.id]
     primary = true
   }
 }

 tags = var.tags

}

# Creates the autoscale settings for our VMs
resource "azurerm_monitor_autoscale_setting" "guru" {
  name                = "AutoscaleSetting"
  resource_group_name = azurerm_resource_group.guru.name
  location            = azurerm_resource_group.guru.location
  target_resource_id  = azurerm_virtual_machine_scale_set.guru.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 2
      minimum = 2
      maximum = 10
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.guru.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.guru.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }

  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true
      custom_emails                         = ["admin@acloud.guru"]
    }
  }
}
