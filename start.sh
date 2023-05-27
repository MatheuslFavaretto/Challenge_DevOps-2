#!/bin/sh

sudo yum update
sudo yum install maven git -y
pkill java
sudo rm -rf api
git clone https://github.com/MatheuslFavaretto/Challenge_DevOps-2.git api && cd api
mvn clean package -DskipTests
nohup java -Dspring.profiles.active=prod -DDATASOURCE_URL=jdbc:mysql://dev-db.c69d0zwlxyuz.us-east-1.rds.amazonaws.com:3306/vollmed_api -DDATASOURCE_USERNAME=sysadmin -DDATASOURCE_PASSWORD=123456 -jar target/api-0.0.1-SNAPSHOT.jar > out.txt 2>&1 &


