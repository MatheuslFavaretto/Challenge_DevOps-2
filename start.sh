#!/bin/sh

sudo yum update
sudo yum install maven git -y
sudo rm -rf api
git clone https://github.com/rcaneppele/2771-spring-boot.git api && cd api
mvn clean package -DskipTests