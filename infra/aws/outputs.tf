output "vm_ip" {
  value = ["API Server: ", aws_instance.api_server.public_ip]
}

output "rds_ip" {
  value = ["DB Endpoint: ", aws_db_instance.api_db.endpoint]
}

