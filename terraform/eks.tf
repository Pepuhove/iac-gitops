# EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.1.5"

  cluster_name                   = var.name
  cluster_version                = var.k8s_version
  cluster_endpoint_public_access = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets

  create_cluster_security_group = false
  create_node_security_group    = false

  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    initial = {
      instance_types = ["t3.small"]
      min_size       = 2
      max_size       = 4
      desired_size   = 2
    }
  }

  tags = var.tags
}
