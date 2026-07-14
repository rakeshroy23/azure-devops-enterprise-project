Azure DevOps Enterprise Project
Terraform + Azure DevOps + GitHub Implementation
Project Name: Azure-devops-enterprise-project
Source Control: GitHub
CI/CD Platform: Azure DevOps (planned)
Infrastructure as Code: Terraform
Cloud Platform: Microsoft Azure
Azure Region: Central India
Branch: feature/terraform-architecture  
1. Project Objective
The goal of this project is to build a production-style Azure DevOps implementation using Terraform and Azure DevOps pipelines.
Primary Objectives
✅ Design secure Azure network architecture
✅ Implement Infrastructure as Code using Terraform
✅ Automate Azure resource deployment using Azure DevOps CI/CD
✅ Implement Git-based branching strategy
✅ Deploy highly available Nginx web servers
✅ Restrict direct VM access
✅ Demonstrate Azure Bastion administration
✅ Configure outbound connectivity using NAT Gateway
✅ Implement production-style CI/CD workflows
✅ Optimize resources for Azure Free Tier  
2. Development Environment Setup
Local Machine
Platform:
MacBook Pro (Apple Silicon)
Tools Installed:
Tool	Version
Git	2.54.0
Azure CLI	2.87.0
Terraform	1.15.7
VS Code	1.128.0

3. Azure Authentication
Azure CLI authentication completed.
Command:
az account show --output table
Subscription:
Azure subscription 1
Tenant:
b19b7ec1-eece-4bf1-bfc1-d24bf5cd8b5d
Terraform authentication flow:
Terraform
    |
    |
AzureRM Provider
    |
    |
Azure CLI Authentication
    |
    |
Azure Subscription
4. Git Repository Setup
GitHub Repository:
https://github.com/rakeshroy23/azure-devops-enterprise-project.git
Remote:
git remote -v
Output:
origin https://github.com/rakeshroy23/azure-devops-enterprise-project.git
Branch:
feature/terraform-architecture
5. Project Folder Structure
Current structure:
Azure-DevOps-Enterprise-Project
|
├── application
│    └── nginx
|
├── docs
|
├── infrastructure
│
│    ├── bootstrap
│    |
│    ├── environments
│    │       |
│    │       ├── dev
│    │       ├── test
│    │       └── prod
│    |
│    ├── modules
│    │       |
│    │       ├── network
│    │       ├── compute
│    │       ├── bastion
│    │       ├── natgateway
│    │       ├── loadbalancer
│    │       └── security
│
├── pipelines
|
└── README.md
Phase 1: Terraform Foundation
Objective
Create Terraform foundation and remote backend resources.
6. Terraform Files Created
Location:
infrastructure/bootstrap
Files:
bootstrap
|
├── versions.tf
├── provider.tf
├── variables.tf
├── locals.tf
├── terraform.tfvars
├── main.tf
└── outputs.tf
7. Terraform Version Management
File:
versions.tf
Purpose:
Defines supported Terraform and provider versions.
Example:
terraform {
 required_version = "~> 1.15"

 required_providers {
   azurerm = {
     source = "hashicorp/azurerm"
     version = "~> 4.0"
   }
 }
}
Interview Questions
Q1. What is the purpose of versions.tf?
Answer:
versions.tf defines:
Terraform version requirement
Provider requirements
Provider versions
It ensures consistency across:
Developer machines
Azure DevOps agents
Production deployments
Q2. Why pin Terraform versions?
Answer:
Pinning versions avoids unexpected failures caused by version changes.
Example:
Developer:
Terraform 1.15.7
AzureRM 4.80
Pipeline:
Terraform 1.16
AzureRM 5.x
May create compatibility issues.
Q3. What does required_providers do?
Answer:
It tells Terraform:
Which provider to download
Where to download it from
Which version to use
Example:
hashicorp/azurerm
8. Terraform Provider Authentication
File:
provider.tf
Created:
provider "azurerm" {
 features {}
}
Interview Question
Why don't we hardcode Azure credentials?
Answer:
Because credentials in code create security risks.
Problems:
Password exposure
Git leaks
Unauthorized access
Instead:
Local:
Azure CLI Authentication
CI/CD:
Azure DevOps Service Connection
+
Workload Identity Federation
9. Terraform Variables and Locals
Variables
Purpose:
User configurable values.
Example:
variable "location"
variable "environment"
variable "resource_group_name"
Values:
terraform.tfvars
Local Values
Purpose:
Internal reusable values.
File:
locals.tf
Example:
locals {

project_name = "azure-devops-enterprise-project"

environment = "dev"

common_tags = {
 ManagedBy="Terraform"
}

}
Interview Questions
Difference between variable and local value?
Variable	Local
User input	Internal value
Environment specific	Configuration specific
terraform.tfvars	locals.tf
Can change	Usually fixed

10. Bootstrap Architecture
Created:
infrastructure/bootstrap
Purpose:
Create Terraform backend resources.
Architecture:
Azure Subscription

        |
        |
        ▼

Resource Group

ado-bootstrap-rg

        |
        |
        ▼

Storage Account

adotfstaterd01

        |
        |
        ▼

Blob Container

tfstate
11. Terraform Initialization
Command:
terraform init
Result:
Terraform has been successfully initialized!
Terraform downloaded:
AzureRM Provider v4.80.0
Interview Question
What does terraform init do?
Answer:
Terraform init:
Initializes working directory
Downloads providers
Configures backend
Creates dependency lock file
12. Terraform Plan
Command:
terraform plan
Result:
Plan: 3 to add
Resources:
Resource Group
Storage Account
Storage Container
Interview Questions
Why does Terraform show:
known after apply
?
Answer:
Because Azure generates the value only after resource creation.
Example:
Resource ID
Storage endpoint
Access keys
Does terraform plan create resources?
Answer:
No.
Plan only shows:
What Terraform wants to change
No Azure changes happen
Creation happens only during:
terraform apply
13. Terraform Apply
Command:
terraform apply
Result:
Apply complete!
Resources: 3 added
Created successfully:
✅ Resource Group
✅ Storage Account
✅ Blob Container  
14. Remote Backend Configuration
Before:
Dev Environment

terraform.tfstate
(local)
After:
Azure Storage

Storage Account
      |
      |
tfstate container
      |
      |
dev/terraform.tfstate
Backend configuration:
Location:
infrastructure/environments/dev/backend.tf
Configuration:
terraform {

backend "azurerm" {

resource_group_name =
"ado-bootstrap-rg"

storage_account_name =
"adotfstaterd01"

container_name =
"tfstate"

key =
"dev/terraform.tfstate"

}

}
Interview Questions
Why does bootstrap use local state?
Answer:
Because bootstrap creates the backend itself.
Using remote backend creates a dependency problem.
Flow:
Bootstrap
 |
Creates Backend
 |
Other environments use Backend
Which environments use remote backend?
Answer:
dev
test
prod
because they manage application infrastructure.
15. Git Progress
Commits completed:
Examples:
Terraform foundation pushed successfully

Bootstrap foundation pushed successfully

Configure Azure remote backend for dev environment
Branch:
feature/terraform-architecture
Current Project Status
Completed:
✅ GitHub repository
✅ Terraform structure
✅ Provider configuration
✅ Variables
✅ Locals
✅ Bootstrap environment
✅ Terraform backend storage
✅ Remote backend for dev  
Next Phase
Phase 2: Azure Infrastructure Deployment
Coming next:
Network Module
Create:
VNet

|
+-- Web Subnet

|
+-- Bastion Subnet

|
+-- Private Backend Subnet
Then:
NSG
NAT Gateway
Azure Bastion
Load Balancer
Nginx deployment
Azure DevOps CI/CD pipeline
Interview Preparation Summary
At this stage you can explain:
✅ Terraform architecture
✅ Root modules
✅ Providers
✅ State management
✅ Backend design
✅ Azure authentication
✅ Dependency management
✅ Variables vs locals
✅ Git branching strategy
✅ Bootstrap pattern  
Phase 1 Status: COMPLETED ✅
Next milestone:
Phase 2 — Secure Azure Network Architecture using Terraform Modules 🚀
























Auto Auto
