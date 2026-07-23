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
