module "dev" {
  source = "../../"

  ami      = "ami-0715c1897453cabd1"
  instance = "t3.small"
  ambiante = "desenvolvimento"

}
