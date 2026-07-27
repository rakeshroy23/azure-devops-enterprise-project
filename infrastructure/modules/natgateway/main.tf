resource "azurerm_public_ip" "nat" {

  name                = "ado-dev-nat-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}
