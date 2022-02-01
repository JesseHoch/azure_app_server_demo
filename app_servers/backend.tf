terraform {
  backend "azurerm" {
    resource_group_name  = "1-c1578a37-playground-sandbox"
    storage_account_name = "tfstates2hcr"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}