variable "location" {

  description = "Azure region"

  type = string

}

variable "resource_group_name" {

  description = "Resource Group Name"

  type = string

}

variable "web_subnet_id" {
  description = "Web subnet ID"
  type        = string
}

variable "admin_username" {

  description = "VM administrator username"

  type = string

}

variable "public_key" {

  description = "SSH Public Key"

  type = string

}

variable "vm_size" {

  description = "Virtual Machine Size"

  type = string

}

variable "tags" {

  description = "Common tags"

  type = map(string)

}
