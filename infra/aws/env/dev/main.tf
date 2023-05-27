module "aws-api-dev" {
    source = "../../"
    instancia = "t2.micro"
    region = "us-east-1"
    key = "aws-key"
    ami = "ami-0715c1897453cabd1"
    sg = "allow-dev-sg"
    nome = "dev"
}


output "private_ip_dev" {
    value = ["API Server Dev: ", module.aws-api-dev.ip_privado ] 
}


