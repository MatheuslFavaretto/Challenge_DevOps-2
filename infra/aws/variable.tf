# VM

variable "associate_public_ip_address" {
  description = "Associar um endereço IP público"
  type        = bool
  default     = true
}

variable "ami" {
  description = "ID da AMI da AWS"
  type        = string
  default     = "ami-0715c1897453cabd1"
}

variable "instance" {
  description = "Tipo de instância"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "Nome do ambiente da aplicação"
  type        = string
  default     = "dev"
}

## SG

variable "sg" {
  description = "ID do grupo de segurança para o RDS"
  type        = string
  default     = "allow-dev-sg"
}

variable "subnetsg" {
  description = "ID do grupo de sub-rede para o RDS"
  type        = string
  default     = "allow-db-subnet-group"
}

## DB

variable "name_db" {
  description = "Nome do banco de dados"
  type        = string
  default     = "aluraflix"
  sensitive   = true
}

variable "username" {
  description = "Nome de usuário do banco de dados RDS"
  type        = string
  default     = "sysadmin"
  sensitive   = true
}

variable "password" {
  description = "Senha do banco de dados RDS"
  type        = string
  default     = "123456789"
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Acesso público ao RDS"
  type        = bool
  default     = true
}

variable "engine" {
  description = "Engine do banco de dados RDS"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Versão da engine do banco de dados RDS"
  type        = string
  default     = "8.0"
}

variable "port" {
  description = "Porta do banco de dados RDS"
  type        = string
  default     = "3306"
}

variable "parameter_group_name" {
  description = "Nome do grupo de parâmetros do banco de dados RDS"
  type        = string
  default     = "default.mysql8.0"
}

variable "instance_class" {
  description = "Classe de instância do banco de dados RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento alocado do banco de dados RDS"
  type        = string
  default     = "20"
}

variable "skip_final_snapshot" {
  description = "Ignorar snapshot final"
  type        = bool
  default     = true
}
