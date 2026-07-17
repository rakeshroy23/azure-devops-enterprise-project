output "nic_ids" {

  value = [

    azurerm_network_interface.web01.id,

    azurerm_network_interface.web02.id

  ]

}
