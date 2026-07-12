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

(To be completed.)

### What does required_providers do?

(To be completed.)

### Why should provider versions be pinned?

(To be completed.)

### What happens during terraform init?

(To be completed.)

---

## Current Status

Project structure completed.

Terraform code implementation has not started yet.
