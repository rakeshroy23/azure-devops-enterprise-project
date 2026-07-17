resource "azurerm_network_interface" "web01" {

  name                = "web01-nic"

  location            = var.location

  resource_group_name = var.resource_group_name

  ip_configuration {

    name                          = "internal"

    subnet_id                     = var.backend_subnet_id

    private_ip_address_allocation = "Dynamic"

  }

  tags = var.tags

}

resource "azurerm_network_interface" "web02" {

  name                = "web02-nic"

  location            = var.location

  resource_group_name = var.resource_group_name

  ip_configuration {

    name                          = "internal"

    subnet_id                     = var.backend_subnet_id

    private_ip_address_allocation = "Dynamic"

  }

  tags = var.tags

}

resource "azurerm_linux_virtual_machine" "web01" {

  name                = "web01"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.web01.id
  ]

  disable_password_authentication = true

  admin_ssh_key {

    username   = var.admin_username
    public_key = var.public_key

  }

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init.tpl", {}))

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "web02" {

  name                = "web02"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.web02.id
  ]

  disable_password_authentication = true

  admin_ssh_key {

    username   = var.admin_username
    public_key = var.public_key

  }

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init.tpl", {}))

  tags = var.tags
}
