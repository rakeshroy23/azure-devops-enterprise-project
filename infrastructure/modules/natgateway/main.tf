resource "azurerm_public_ip" "nat" {

  name                = "ado-dev-nat-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway" "main" {

  name                = "ado-dev-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "main" {

  nat_gateway_id       = azurerm_nat_gateway.main.id
  public_ip_address_id = azurerm_public_ip.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "web" {

  subnet_id      = var.web_subnet_id
  nat_gateway_id = azurerm_nat_gateway.main.id
}
