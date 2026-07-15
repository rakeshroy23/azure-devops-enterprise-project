variable "resource_group_name" {
  description = "Resource group where security resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "web_subnet_id" {
  description = "Web subnet resource ID"
  type        = string
}

variable "backend_subnet_id" {
  description = "Backend subnet resource ID"
  type        = string
}

variable "bastion_subnet_id" {
  description = "Bastion subnet resource ID"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
