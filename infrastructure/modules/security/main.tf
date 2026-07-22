resource "azurerm_network_security_group" "web" {

  name                = "web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}


resource "azurerm_network_security_group" "backend" {

  name                = "backend-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "web" {

  subnet_id = var.web_subnet_id

  network_security_group_id = azurerm_network_security_group.web.id

  depends_on = [
    azurerm_network_security_group.web
  ]
}


resource "azurerm_subnet_network_security_group_association" "backend" {

  subnet_id = var.backend_subnet_id

  network_security_group_id = azurerm_network_security_group.backend.id

  depends_on = [
    azurerm_network_security_group.backend
  ]
}
