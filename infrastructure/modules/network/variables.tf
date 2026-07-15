variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "web_subnet_address_prefix" {
  description = "Web subnet CIDR"
  type        = list(string)
}

variable "bastion_subnet_address_prefix" {
  description = "Bastion subnet CIDR"
  type        = list(string)
}

variable "backend_subnet_address_prefix" {
  description = "Backend subnet CIDR"
  type        = list(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
