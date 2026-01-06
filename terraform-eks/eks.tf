module "eks" {
    #import the module of template 
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"
  # cluster info (control plane)
  name               = local.name
  kubernetes_version = "1.29"


  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  #enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  
   addons = {
        vpc_cni = {
            most_recent= true
        }
        kube_proxy = {
            most_recent= true
        }
        coredns = {
            most_recent= true
        }

    }

  # specific for control plane network
  control_plane_subnet_ids = module.vpc.intra_subnets
  
  # managing nodes in the cluster
  eks_managed_node_groups = {
    default = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]
    }
   
    tws-ng = {
              instance_types = ["t3.small"]

      min_size     = 2
      max_size     = 3
      desired_size = 2
      capacity_type = "SPOT"
    }
  }

  

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}