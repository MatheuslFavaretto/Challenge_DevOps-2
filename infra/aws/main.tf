terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Backend para armazenar o estado do Terraform
terraform {
  backend "s3" {
    bucket  = "matheus-devops-backup-test"
    key     = "aws/terraform.tfstate"
    region  = "us-east-1"
    version = 5
  }
}