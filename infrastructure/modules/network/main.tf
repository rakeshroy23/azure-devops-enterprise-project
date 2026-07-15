resource "azurerm_virtual_network" "main" {

  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet" "web" {

  name = "web-subnet"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = var.web_subnet_address_prefix
}

resource "azurerm_subnet" "bastion" {

  name = "AzureBastionSubnet"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = var.bastion_subnet_address_prefix
}

resource "azurerm_subnet" "backend" {

  name = "backend-subnet"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = var.backend_subnet_address_prefix
}
