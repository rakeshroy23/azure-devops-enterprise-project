output "vnet_id" {

  description = "Virtual Network ID"

  value = azurerm_virtual_network.main.id

}


output "web_subnet_id" {

  description = "Web subnet ID"

  value = azurerm_subnet.web.id

}


output "bastion_subnet_id" {

  description = "Bastion subnet ID"

  value = azurerm_subnet.bastion.id

}


output "backend_subnet_id" {

  description = "Backend subnet ID"

  value = azurerm_subnet.backend.id

}
