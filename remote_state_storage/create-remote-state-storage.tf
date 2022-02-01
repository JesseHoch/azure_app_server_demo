terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.94.0"
    }
  }
}

# Configures the Microsoft Azure Provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Configures the Azure Resource Group
resource "azurerm_resource_group" "guru" {
  #name     = "<RESOURCE_GROUP_NAME>"
  #location = "<LOCATION>"
}

# Creates random string for the Unique ID for the Azure Storage Account Name
#resource "random_string" "resource_code" {
#  length  = 5
#  special = false
#  upper   = false
#}

# Creates the Azure Storage Account
#resource "azurerm_storage_account" "tfstate" {
#  name                     = "tfstate${random_string.resource_code.result}"
#  resource_group_name      = azurerm_resource_group.guru.name
#  location                 = azurerm_resource_group.guru.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#  allow_blob_public_access = true

#  tags = {
#    environment = "staging"
#  }
#}

# Creates the Azure Storage Container
#resource "azurerm_storage_container" "tfstate" {
#  name                  = "tfstate"
#  storage_account_name  = azurerm_storage_account.tfstate.name
#  container_access_type = "blob"
#}