#!/bin/sh

sudo yum update
sudo yum install maven git -y
sudo rm -rf api
git clone https://github.com/MatheuslFavaretto/-Challenge_DevOps-2.git api && cd api
mvn clean package -DskipTests