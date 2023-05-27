#!/bin/sh

sudo yum update
sudo yum install maven git -y
sudo rm -rf api
mvn clean package -DskipTests