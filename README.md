# Terraform Terragrunt AWS Modules Test

This repository contains a sample project demonstrating the use of Terraform, Terragrunt, and Terraform AWS modules to manage infrastructure on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Terragrunt](https://terragrunt.gruntwork.io/) installed on your local machine.
- An AWS account with appropriate permissions to create and manage resources.
- AWS CLI configured with your [AWS account credentials](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)

## Project Structure

The project is structured as follows:

```bash
terraform-terragrunt-aws-modules-test/
├── modules/
│ ├── example-module/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
├── live/
│ ├── terragrunt.hcl
│ ├── environment/
│ │ └── terragrunt.hcl
└── README.md
```

- **modules/**: Contains reusable Terraform modules.
- **live/**: Contains environment-specific Terragrunt configurations. e.g. dev, staging, prod (I only focus on dev right now.)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/JeremyArc/terraform-terragrunt-aws-modules-test.git
cd terraform-terragrunt-aws-modules-test/
```

### 2. Apply the Configuration

Navigate to the environment directory you want to work with and apply Terragrunt (In this case, I only create dev environment).

To apply the Terraform configuration and create the infrastructure:

```bash
# On live/dev
terragrunt run-all apply
```

You will be asked to create a remote state s3 bucket, type `yes` in the terminal.

`Remark: it will take around 10 minute to create a EKS cluster and node group`

### 3. Destroy the Infrastructure

Clear all infrastructure

```bash
# On live/dev
  terragrunt run-all destroy
```
