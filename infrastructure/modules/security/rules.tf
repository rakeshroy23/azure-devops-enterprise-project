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

resource "azurerm_network_security_rule" "bastion_https" {

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

  network_security_group_name = azurerm_network_security_group.bastion.name
}


resource "azurerm_network_security_rule" "bastion_gateway_manager" {

  name = "allow-gateway-manager"

  priority = 110

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "443"

  source_address_prefix = "GatewayManager"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_rule" "bastion_health_probe" {

  name = "allow-azure-load-balancer"

  priority = 120

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "443"

  source_address_prefix = "AzureLoadBalancer"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_rule" "bastion_virtual_network" {

  name = "allow-virtual-network"

  priority = 130

  direction = "Inbound"

  access = "Allow"

  protocol = "*"

  source_port_range = "*"

  destination_port_range = "*"

  source_address_prefix = "VirtualNetwork"

  destination_address_prefix = "*"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_rule" "bastion_ssh_outbound" {

  name = "allow-ssh-outbound"

  priority = 100

  direction = "Outbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "22"

  source_address_prefix = "*"

  destination_address_prefix = "VirtualNetwork"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_rule" "bastion_rdp_outbound" {

  name = "allow-rdp-outbound"

  priority = 110

  direction = "Outbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "3389"

  source_address_prefix = "*"

  destination_address_prefix = "VirtualNetwork"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_rule" "bastion_azurecloud" {

  name = "allow-azure-cloud"

  priority = 120

  direction = "Outbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "443"

  source_address_prefix = "*"

  destination_address_prefix = "AzureCloud"

  resource_group_name = var.resource_group_name

  network_security_group_name = azurerm_network_security_group.bastion.name
}
