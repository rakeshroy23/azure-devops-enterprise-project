output "public_ip" {
  value = azurerm_public_ip.lb.ip_address
}

output "load_balancer_id" {
  value = azurerm_lb.main.id
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.web.id
}
