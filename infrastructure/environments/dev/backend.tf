terraform {
  backend "azurerm" {
    resource_group_name  = "ado-bootstrap-rg"
    storage_account_name = "adotfstaterd01"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}
