locals {
  project_name = "azure-devops-enterprise-project"
  environment  = "dev"
  location     = "Central India"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = "Rakesh"
  }

  name_prefix = "ado-dev"
}
