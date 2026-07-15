resource "azurerm_network_security_rule" "web_https" {

  name = "allow-https"

  priority = 100

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "443"

  source_address_prefix = "Internet"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.web.name
}


resource "azurerm_network_security_rule" "web_http" {

  name = "allow-http"

  priority = 110

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "80"

  source_address_prefix = "Internet"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.web.name
}

resource "azurerm_network_security_rule" "backend_from_web" {

  name = "allow-web-to-backend"

  priority = 100

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "*"

  source_address_prefix = "10.10.1.0/24"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.backend.name
}


resource "azurerm_network_security_rule" "backend_ssh_from_bastion" {

  name = "allow-ssh-from-bastion"

  priority = 110

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "22"

  source_address_prefix = "10.10.2.0/27"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.backend.name
}

