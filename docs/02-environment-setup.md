# Lab 2 – Environment Setup

## Objective

Prepare the local development environment and Azure subscription for Infrastructure as Code development.

---

## Prerequisites

- Azure Subscription
- GitHub Account
- Azure DevOps Organization
- Visual Studio Code
- Terraform
- Azure CLI
- Git

---

## Tool Verification

### Git

```bash
git --version
```

Output

```
git version 2.54.0
```

---

### Azure CLI

```bash
az version
```

Output

```
Azure CLI 2.87.0
```

---

### Terraform

```bash
terraform version
```

Output

```
Terraform v1.15.7
```

---

### VS Code

```bash
code --version
```

Output

```
1.128.0
```

---

## Azure Login

```bash
az login
```

Verify:

```bash
az account show --output table
```

Subscription verified successfully.

---

## Azure Region

Selected Region

```
centralindia
```

Reason:

- Service availability
- Low latency
- Suitable for Azure Free Trial

---

## Project Folder Structure

(Insert the latest project tree.)

---

## Lessons Learned

- Verified all development tools.
- Authenticated with Azure.
- Selected deployment region.
- Created enterprise repository structure.

---

## Status

Completed
