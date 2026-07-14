variable "location" {
  description = "Azure region for backend resources"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource Group for Terraform backend"
  type        = string
}

variable "storage_account_name" {
  description = "Terraform backend storage account name"
  type        = string
}

variable "container_name" {
  description = "Blob container for Terraform state"
  type        = string
}
