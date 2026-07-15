resource "azurerm_resource_group" "main" {

  name = "${local.name_prefix}-rg"

  location = var.location

  tags = local.common_tags

}

module "network" {

  source = "../../modules/network"

  vnet_name = "${local.name_prefix}-vnet"

  resource_group_name = azurerm_resource_group.main.name

  location = var.location

  vnet_address_space = var.vnet_address_space

  web_subnet_address_prefix = var.web_subnet_address_prefix

  bastion_subnet_address_prefix = var.bastion_subnet_address_prefix

  backend_subnet_address_prefix = var.backend_subnet_address_prefix

  tags = local.common_tags

}

module "security" {

  source = "../../modules/security"

  resource_group_name = azurerm_resource_group.main.name

  location = var.location

  web_subnet_id = module.network.web_subnet_id

  backend_subnet_id = module.network.backend_subnet_id

  bastion_subnet_id = module.network.bastion_subnet_id

  tags = local.common_tags

}


