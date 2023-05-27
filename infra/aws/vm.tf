resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}


resource "aws_instance" "api_server" {
  ami                         = var.ami
  instance_type               = var.instance
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.sg-dev.id]

  tags = {
    Name = "${var.name}-API"
  }
}
