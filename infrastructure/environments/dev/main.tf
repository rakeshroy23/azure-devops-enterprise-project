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

  tags = local.common_tags

}

module "compute" {

  source = "../../modules/compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  web_subnet_id = module.network.web_subnet_id

  admin_username = var.admin_username
  public_key     = var.public_key
  vm_size        = var.vm_size

  tags = local.common_tags
}

module "loadbalancer" {

  source = "../../modules/loadbalancer"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  tags = local.common_tags

  web_nic_ids = module.compute.nic_ids
}

module "bastion" {
  source = "../../modules/bastion"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  bastion_subnet_id = module.network.bastion_subnet_id
  tags              = local.common_tags
}

module "natgateway" {

  source = "../../modules/natgateway"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  web_subnet_id = module.network.web_subnet_id

  tags = local.common_tags
}

module "keyvault" {

  source = "../../modules/keyvault"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = local.common_tags
}
