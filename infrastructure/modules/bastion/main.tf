resource "azurerm_public_ip" "bastion" {

  name                = "ado-dev-bastion-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}
