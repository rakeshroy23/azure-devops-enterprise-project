locals {
  project_name = "azure-devops-enterprise-project"

  environment = "bootstrap"

  location = "Central India"

  name_prefix = "ado-bootstrap"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Purpose     = "Terraform Backend"
  }
}
