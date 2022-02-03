terraform {
  # Backend Remote State Storage in Azure Storage
  backend "azurerm" {
    resource_group_name  = "<resource_group>"
    storage_account_name = "<storage_account_name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
