output "public_ip_id" {
  value = azurerm_public_ip.bastion.id
}

output "public_ip_address" {
  value = azurerm_public_ip.bastion.ip_address
}
