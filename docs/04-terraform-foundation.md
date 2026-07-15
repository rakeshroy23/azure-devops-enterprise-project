# Lab 4 – Terraform Foundation

## Objective

Prepare the Terraform project architecture before writing Infrastructure as Code.

---

## Terraform Directory Structure

Describe the `infrastructure/` layout, including `environments`, `modules`, and `scripts`, and explain why each folder exists.

---

## Terraform Root Module

Environment

```
dev
```

Each environment acts as an independent Terraform Root Module.

Benefits

- Independent state
- Independent variables
- Easy promotion between environments
- Better maintainability

---

## Terraform Modules

Planned Modules

- Network
- Compute
- Security
- Bastion
- NAT Gateway
- Load Balancer

---

## Purpose of Each Terraform File

### versions.tf

Defines Terraform and provider version requirements.

### provider.tf

Will configure Azure provider authentication.

### variables.tf

Declares input variables.

### terraform.tfvars

Stores environment-specific values.

### locals.tf

Stores reusable local values.

### outputs.tf

Exposes useful deployment information.

### main.tf

Calls reusable modules.

---

## Terraform Execution Flow

terraform init

↓

Download Providers

↓

Configure Backend

↓

Terraform Plan

↓

Terraform Apply

↓

Update State

---

## Knowledge Check

### Why do we use versions.tf?

"versions.tf defines the supported Terraform CLI version and the required provider versions. It ensures that developers and CI/CD pipelines use compatible versions, resulting in consistent and predictable infrastructure deployments.

### What does required_providers do?

"required_providers tells Terraform which provider plugins are required, where to download them from, and which versions are supported. During terraform init, Terraform downloads these providers from the Terraform Registry."

### Why should provider versions be pinned?

By pinning everyone including Azure DevOps agents uses same compatible verions

### What happens during terraform init?

terraform init

↓

Read all *.tf files
↓

find required providers

↓

Download Provider plugins

↓


Configure Backend
↓

Intilize working Directory
↓

Terraform ready for Plan/Apply

---

## Current Status

Variables created
Local values created
Environment-specific values in terraform.tfvars
CIDR addressing decisions
Authentication approach (Azure CLI locally, OIDC in Azure DevOps)
Key interview questions and answers from these lessons
