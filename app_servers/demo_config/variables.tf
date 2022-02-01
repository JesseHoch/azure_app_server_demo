variable "rg_name" {
  description = "Value of the Resource Group Name"
  type        = string
  default     = "1-c1578a37-playground-sandbox"
}

variable "st_account_name" {
  description = "Value of the Storage Account Name"
  type        = string
  default     = "tfstates2hcr"
}

variable "admin_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}