# Terraform AWS Project

This repository contains Terraform configuration files to set up and manage infrastructure on AWS.

## Prerequisites

Before running this project, ensure you have the following:

- **Terraform** installed on your system. You can download it [here](https://www.terraform.io/downloads.html).
- An **AWS account** and access to credentials with sufficient permissions to create the required resources.
- **AWS CLI** installed and configured. Follow the [AWS CLI setup guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) if not already done.

## Getting Started

Follow these steps to initialize and apply the Terraform configuration:

### Step 1: Configure AWS Credentials

Run the following command to set up your AWS credentials:

```bash
aws configure
```
### Step 2: Initialize Terraform

```bash
terraform init
```

### Step 3: Validate Configuration

```bash
terraform validate
```
### Step 4: Apply the Configuration

```bash
terraform apply
```
