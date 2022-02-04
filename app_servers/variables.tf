# Sets the variables for our configuration
variable "rg_name" {
  description = "Value of the Resource Group Name"
  type        = string
  default     = "<RESOURCE_GROUP>"
}

variable "location" {
  description = "Value of the Resource Group Location"
  type        = string
  default     = "<LOCATION>"
}

variable "storage_account_name" {
  description = "Value of the Azure Storage Account Name"
  type        = string
  default     = "<STORAGE_ACCOUNT_NAME>"
}

variable "container_name" {
  description = "Value of the Azure Storage Container Name"
  type        = string
  default     = "<CONTAINER_NAME>"
}

variable "tags" {
 description = "A map of the tags to use for the resources that are deployed"
 type        = map(string)

 default = {
   environment = "demo"
 }
}

locals {
  regions_with_availability_zones = ["<LOCATION>"] #["centralus","eastus2","eastus","westus"]
  zones = contains(local.regions_with_availability_zones, var.location) ? list("1","2","3") : null
}

variable "azurerm_virtual_machine_scale_set" {
 description = "The name of the virtual network in which the resources will be created"
 default     = "GuruVMScaleSet"
 type = string
}
  
variable "availability_zone_names" {
 description = "The name of the virtual network in which the resources will be created"
 default     = ["<LOCATION>"]
 type    = list(string)
}

variable "application_port" {
   description = "The port that you want to expose to the external load balancer"
   default     = 80
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
  default     = "azureuser"
  sensitive   = true
}

variable "admin_password" {
  description = "Administrator password"
  type        = string
  default     = "pW1234"
  sensitive   = true
}
