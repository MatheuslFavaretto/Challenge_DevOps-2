#!/bin/sh

pkill java
sudo rm -rf api
git clone https://github.com/rcaneppele/2771-spring-boot.git api && cd api
mvn clean package -DskipTests
nohup java -Dspring.profiles.active=prod -DDATASOURCE_URL=jdbc:mysql://dev-db.c69d0zwlxyuz.us-east-1.rds.amazonaws.com/vollmed_api -DDATASOURCE_USERNAME=sysadmin -DDATASOURCE_PASSWORD=123456789 -jar target/api-0.0.1-SNAPSHOT.jar > out.txt 2>&1 &