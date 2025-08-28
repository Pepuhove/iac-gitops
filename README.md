# AWS Infrastructure with Terraform (EKS, VPC, ECR, IAM, S3 Backend)

This project provisions a complete AWS infrastructure using **Terraform**. It includes an Amazon EKS cluster, ECR repository, VPC, IAM roles/policies, and S3 remote backend for state management.  

---

## 🚀 Features
- **Amazon VPC** with private and public subnets across multiple AZs.
- **Amazon EKS** cluster with managed node groups.
- **Amazon ECR** repository for storing container images.
- **IAM Roles & Policies** for secure access control.
- **S3 Remote Backend** for Terraform state management.
- **Cluster Add-ons**: CoreDNS, kube-proxy, VPC-CNI.

---

## 🏗️ Architecture
```plaintext
                ┌───────────────────────────────────┐
                │            AWS Cloud              │
                │                                   │
                │   ┌──────────────┐                │
                │   │   VPC        │                │
                │   │  (Public &   │                │
                │   │  Private     │                │
                │   │  Subnets)    │                │
                │   └─────┬────────┘                │
                │         │                         │
                │   ┌─────▼─────┐                   │
                │   │   EKS     │                   │
                │   │ Cluster   │                   │
                │   └─────┬─────┘                   │
                │         │                         │
                │   ┌─────▼─────┐                   │
                │   │ Node      │                   │
                │   │ Groups    │                   │
                │   └───────────┘                   │
                │                                   │
                │   ┌───────────────┐               │
                │   │   ECR Repo    │               │
                │   └───────────────┘               │
                │                                   │
                │   ┌───────────────┐               │
                │   │   S3 Bucket   │ (TF Backend)  │
                │   └───────────────┘               │
                └───────────────────────────────────┘
⚙️ Prerequisites
Terraform v1.5+

AWS CLI configured with credentials

An S3 bucket created for the Terraform backend (example: finance1214)

IAM user with admin or sufficient permissions

📂 Project Structure
bash
Copy code
├── main.tf               # Main infrastructure definition
├── variables.tf          # Input variables
├── outputs.tf            # Terraform outputs
├── provider.tf           # AWS provider config
├── backend.tf            # S3 remote backend config
└── README.md             # Documentation
🚦 Usage
1️⃣ Initialize Terraform
bash
Copy code
terraform init
2️⃣ Validate Configuration
bash
Copy code
terraform validate
3️⃣ Plan Infrastructure
bash
Copy code
terraform plan
4️⃣ Apply Infrastructure
bash
Copy code
terraform apply -auto-approve
5️⃣ Destroy Infrastructure
bash
Copy code
terraform destroy -auto-approve
🔑 Variables
Variable	Description	Example
aws_region	AWS region for resources	us-east-1
name	EKS Cluster Name	finance-cluster
k8s_version	Kubernetes version for EKS	1.29
tags	Resource tags	{env = "dev"}

📜 Outputs
Output	Description
cluster_name	Name of the EKS Cluster
cluster_id	ID of the EKS Cluster
vpc_id	VPC ID created by Terraform
ecr_url	URL of the ECR repository

🛡️ Security
IAM Roles are created with least privilege access.

S3 Backend ensures centralized and secure state management.

Private Subnets are used for EKS nodes to enhance security.

📌 Notes
The EKS cluster uses managed node groups with t3.micro instances.

Security Groups and IAM roles can be extended depending on workloads.

Destroying the stack will remove all resources (EKS, ECR, VPC, IAM, etc.).

👨‍💻 Author
Pepukai Hove

🌍 Cape Town, South Africa

📧 pepshove@gmail.com

☁️ AWS Certified Solutions Architect – Associate

🛠️ DevOps Engineer | Cloud Engineer

