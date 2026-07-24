resource "azurerm_public_ip" "lb" {

  name                = "web-lb-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_lb" "main" {

  name                = "web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  frontend_ip_configuration {

    name                 = "public-frontend"
    public_ip_address_id = azurerm_public_ip.lb.id

  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "web" {

  name = "web-backend-pool"

  loadbalancer_id = azurerm_lb.main.id

}

resource "azurerm_network_interface_backend_address_pool_association" "web01" {

  network_interface_id = var.web_nic_ids[0]

  ip_configuration_name = "internal"

  backend_address_pool_id = azurerm_lb_backend_address_pool.web.id
}

resource "azurerm_network_interface_backend_address_pool_association" "web02" {

  network_interface_id = var.web_nic_ids[1]

  ip_configuration_name = "internal"

  backend_address_pool_id = azurerm_lb_backend_address_pool.web.id
}

resource "azurerm_lb_probe" "http" {

  name            = "http-probe"
  loadbalancer_id = azurerm_lb.main.id

  protocol = "Http"
  port     = 80

  request_path = "/"

  interval_in_seconds = 5
  number_of_probes    = 2
}
