# Lab 3 – GitHub and Azure DevOps Integration

## Objective

Connect Azure DevOps to Azure using a secure Azure Resource Manager service connection.

## Authentication Method

- Azure Resource Manager
- Workload Identity Federation (OIDC)

## Service Connection Name

sc-devops-enterprise

## Why Workload Identity Federation?

- No client secrets
- Short-lived authentication tokens
- Recommended by Microsoft
- Better security posture

# Lab 3 – GitHub and Azure DevOps Integration

## Objective

Configure source control and Azure DevOps for enterprise CI/CD.

---

## GitHub Repository

Repository

```
azure-devops-enterprise-project
```

Remote

```
https://github.com/rakeshroy23/azure-devops-enterprise-project.git
```

---

## Azure DevOps Project

Project Name

```
Azure-devops-enterprise-project
```

---

## Authentication

Authentication Method

```
Azure Resource Manager
Workload Identity Federation (OIDC)
```

Why OIDC?

- No client secrets
- Secure authentication
- Recommended by Microsoft
- Supports short-lived tokens

---

## Service Connection

Name

```
sc-devops-enterprise
```

Status

```
Verified
```

---

## Planned Git Strategy

main

↓

develop

↓

feature/*

Workflow

Developer

↓

Feature Branch

↓

Pull Request

↓

Develop

↓

Main

---

## Pipeline Strategy

Bootstrap Pipeline

↓

Terraform CI

↓

Terraform CD

↓

Application CI

↓

Application CD

---

## Lessons Learned

- Connected Azure DevOps with Azure.
- Configured Workload Identity Federation.
- Planned Git workflow.
- Planned pipeline architecture.

---

## Status

Completed
