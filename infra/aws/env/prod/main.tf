module "dev" {
  source = "../../"

  ami      = "ami-0715c1897453cabd1"
  instance = "t3.small"
  ambiante = "produção"

}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "instance_id" {
  value = module.ec2_instance.id
}


output "private_ip" {
  value = module.ec2_instance.private_ip
}
