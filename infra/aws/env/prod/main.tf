module "aws-api-prod" {
    source = "../../"
    instancia = "t2.micro"
    region = "us-east-1"
    key = "aws-key"
    ami = "ami-0715c1897453cabd1"
    sg = "allow-prod-sg"
    nome = "prod"
}

output "private_ip_prod" {
    value = ["API Server Prod: ", module.aws-api-prod.ip_privado]
}


