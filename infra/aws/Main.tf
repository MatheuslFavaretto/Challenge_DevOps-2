terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}



resource "null_resource" "create_ansible_hosts" {
  depends_on = [module.ec2_instance.public_ip]
  provisioner "local-exec" {
    command = <<-EOT
      echo "[web-server]" > hosts.yml
      echo "${module.ec2_instance.public_ip[0]}" >> hosts.yml
    EOT
  }
}

