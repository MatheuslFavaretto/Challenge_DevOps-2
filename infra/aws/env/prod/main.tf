module "dev" {
  source = "../../"

  ami      = "ami-0715c1897453cabd1"
  instance = "t3.small"
  ambiante = "producao"

}

output "public_ip" {
  value = module.dev.public_ip
}

output "private_ip" {
  value = module.dev.private_ip
}
