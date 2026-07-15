# Azure Region
location = "centralindia"

# Environment
environment = "dev"

# Project
project_name = "azure-devops-enterprise-project"

# Resource Group
resource_group_name = "ado-dev-rg"

# Networking
vnet_address_space = [
  "10.10.0.0/16"
]

web_subnet_address_prefix = [
  "10.10.1.0/24"
]

bastion_subnet_address_prefix = [
  "10.10.2.0/27"
]

backend_subnet_address_prefix = [
  "10.10.3.0/24"
]
