output "nic_ids" {

  value = [

    azurerm_network_interface.web01.id,

    azurerm_network_interface.web02.id

  ]

}

output "web01_private_ip" {
  value = azurerm_network_interface.web01.private_ip_address
}

output "web02_private_ip" {
  value = azurerm_network_interface.web02.private_ip_address
}

output "web01_vm_id" {
  value = azurerm_linux_virtual_machine.web01.id
}

output "web02_vm_id" {
  value = azurerm_linux_virtual_machine.web02.id
}
