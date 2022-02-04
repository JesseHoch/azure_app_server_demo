terraform {
  # Backend Remote State Storage in Azure Storage
  # You can not use variables for the values in this resource
  backend "azurerm" {
    resource_group_name  = "<RESOURCE_GROUP_NAME>"
    storage_account_name = "<STORAGE_ACCOUNT_NAME>"
    container_name       = "CONTAINER_NAME"
    key                  = "terraform.tfstate"
  }
}
