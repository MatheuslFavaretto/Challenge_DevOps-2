resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"

  name                        = var.ambiante
  key_name                    = aws_key_pair.key.key_name
  instance_type               = "t2.micro"
  ami                         = "ami-0715c1897453cabd1"
  associate_public_ip_address = true

  subnet_id              = module.vpc.public_subnets[0]
  subnet_ids             = module.vpc.public_subnets
  vpc_security_group_ids = [aws_security_group.sg-dev.id]

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
