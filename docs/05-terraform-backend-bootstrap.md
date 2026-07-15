What Terraform state is.
Why local state is unsuitable for teams.
What a remote backend is.
Why Azure Storage is used.
The bootstrap problem.
Why we chose a separate bootstrap configuration

What is a root module?
Ans: A Terraform root module is the directory where Terraform commands such as terraform init, plan, and apply are executed. It contains the configuration that Terraform starts from and can call reusable child modules."
Why do we have two root modules?
Ans:This separation is one of Terraform's core design principles.
Why the bootstrap uses the same provider.
Ans:"Both the bootstrap project and the main infrastructure deploy resources to Azure using the AzureRM provider. Although they create different resources, they authenticate to the same Azure subscription, so they can use the same provider configuration."
Bootstrap architecture diagram.
bootstrap/
├── versions.tf
├── provider.tf
├── locals.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
└── outputs.tf

