variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "azure-devops-enterprise-project"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "web_subnet_address_prefix" {
  description = "Address prefix for the web subnet"
  type        = list(string)
}

variable "bastion_subnet_address_prefix" {
  description = "Address prefix for the Azure Bastion subnet"
  type        = list(string)
}

variable "backend_subnet_address_prefix" {

  description = "Address prefix for backend subnet"

  type = list(string)

}

variable "admin_username" {
  description = "VM administrator username"
  type        = string
}

variable "public_key" {

  description = "SSH public key"

  type = string

}

variable "vm_size" {
  description = "Azure VM Size"
  type        = string
}
