#!/bin/bash

# Atualizar pacotes
sudo yum update -y

# Instalar Maven e Git
sudo yum install maven git -y

# Clone repositorio

sudo git clone https://github.com/rcaneppele/2771-spring-boot.git

# permissao

sudo chmod -R 777 2771-spring-boot

#intrando nos arquivos

cd 2771-spring-boot/

# Compilar o projeto (pulando os testes)
mvn clean package -DskipTests

# Executar o projeto em ambiente de produção

java  -jar target/api-0.0.1-SNAPSHOT.jar

