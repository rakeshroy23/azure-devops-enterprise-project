resource "azurerm_public_ip" "bastion" {

  name                = "ado-dev-bastion-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "main" {

  name                = "ado-dev-bastion"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Basic"

  ip_configuration {

    name = "configuration"

    subnet_id = var.bastion_subnet_id

    public_ip_address_id = azurerm_public_ip.bastion.id
  }

  tags = var.tags
}
