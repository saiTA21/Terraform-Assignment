variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type = map
  default = {
	"default" = "10.0.0.0/16"
	"qa" = "10.1.0.0/16"
	}
}

variable "subnet_cidr_block_main" {
  description = "The CIDR block for the main subnet"
  type = map
  default = {
  "default" = "10.0.1.0/24"
  "qa" = "10.1.1.0/24"
  }
}

variable "subnet_cidr_block_main2" {
  description = "The CIDR block for the main2 subnet"
  type = map
  default = {
  "default" = "10.0.2.0/24"
  "qa" = "10.1.2.0/24"
  }
}

variable "subnet_availability_zone_main2" {
  description = "The availability zone for the main2 subnet"
  default = "us-east-1a"
}

variable "subnet_availability_zone_main" {
  description = "The availability zone for the main2 subnet"
  default = "us-east-1b"
}

variable "name_eks"{
	description= "Name of the EKS Cluster"
	type = map
	default = {
	"default" = "my_cluster"
	"qa" = "qa_cluster"
	}
}
