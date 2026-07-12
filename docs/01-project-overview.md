# Azure DevOps Enterprise Project

## Project Overview

This project demonstrates a production-style Azure DevOps implementation using GitHub, Azure DevOps, Terraform, and Microsoft Azure.

The objective is to provision Azure infrastructure through Infrastructure as Code (IaC) using Terraform, automate deployments through Azure DevOps pipelines, and implement secure networking and administration practices.

The project follows enterprise DevOps principles including:

- Infrastructure as Code (Terraform)
- Git-based version control
- Pull Request based development
- CI/CD using Azure DevOps
- Modular Terraform architecture
- Secure authentication using Workload Identity Federation
- Environment separation (Development, Test, Production)
- Reusable Terraform modules
- Production-style documentation

---

## Project Objectives

- Design a secure Azure network architecture.
- Implement Infrastructure as Code using Terraform.
- Store source code in GitHub.
- Build CI/CD pipelines using Azure DevOps.
- Deploy Azure resources through Terraform.
- Deploy highly available Nginx web servers.
- Configure Azure Bastion for secure administration.
- Configure Azure NAT Gateway for outbound internet connectivity.
- Restrict direct SSH access to backend virtual machines.
- Optimize resource usage for Azure Free Trial.

---

## High-Level Architecture

Developer
        │
Git Push
        │
GitHub
        │
Pull Request
        │
Azure DevOps Pipeline
        │
Terraform Plan
        │
Approval
        │
Terraform Apply
        │
Azure Infrastructure
        │
Load Balancer
        │
Nginx Virtual Machines

---

## Technology Stack

| Technology | Purpose |
|------------|---------|
| Azure | Cloud Platform |
| Azure DevOps | CI/CD |
| GitHub | Source Control |
| Terraform | Infrastructure as Code |
| Azure CLI | Azure Management |
| VS Code | Development |
| Linux VM | Compute |
| Nginx | Web Server |

---

## Repository Structure

Azure-DevOps-Enterprise-Project % tree
.
├── application
│   └── nginx
├── docs
│   ├── 01-project-overview.md
│   └── 03-github-and-azure-devops.md
├── infrastructure
│   ├── environments
│   │   ├── dev
│   │   │   ├── backend.conf
│   │   │   ├── backend.tf
│   │   │   ├── locals.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── provider.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   ├── prod
│   │   └── test
│   ├── modules
│   │   ├── bastion
│   │   ├── compute
│   │   ├── loadbalancer
│   │   ├── natgateway
│   │   ├── network
│   │   └── security
│   └── scripts
├── pipelines
└── README.md

---

## Current Progress

- Project structure created
- Azure CLI configured
- Azure subscription verified
- GitHub repository created
- Azure DevOps project created
- Azure Service Connection created
- Terraform project structure prepared
