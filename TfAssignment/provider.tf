
terraform {
  required_version = "1.7.3" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }     
}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
terraform {
    backend "s3" {
        bucket = "eks-cluster-sai" #buceket name
        key    = "state/terraform.tfstate" #path where we are going to st ore the state file
        region     = "us-east-1" 
        
    }
}