module "vpc"{
	source="../vpc"
	vpc_cidr_block = var.vpc_cidr_block
	subnet_cidr_block_main = var.subnet_cidr_block_main
	subnet_cidr_block_main2 = var.subnet_cidr_block_main2
	subnet_availability_zone_main2 = var.subnet_availability_zone_main2
	subnet_availability_zone_main = var.subnet_availability_zone_main
	name_eks=var.name_eks #doubt
}

data "aws_iam_role" "existing_eks_cluster_role" {
  name = "AWSServiceRoleForAmazonEKS"
}

data "aws_iam_role" "nodes" {
  name = "eks-node-group-nodes"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = lookup(var.name_eks, terraform.workspace)
  role_arn = data.aws_iam_role.existing_eks_cluster_role.arn
  vpc_config {
    subnet_ids = [module.vpc.subnet_id_main,module.vpc.subnet_id_main2]
  }
}

resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "private-nodes"
  node_role_arn   = data.aws_iam_role.nodes.arn

  subnet_ids = [module.vpc.subnet_id_main,module.vpc.subnet_id_main2]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }
  depends_on = [aws_eks_cluster.my_cluster]

}

