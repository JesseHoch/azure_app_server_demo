terraform {
  # Backend Remote State Storage in Azure Storage
  backend "azurerm" {
    resource_group_name  = var.rg_name
    storage_account_name = "<storage_account_name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
