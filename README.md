## 💻 Sobre o projeto

Fazer o deploy de uma aplicação através de uma maquina virtual.

Para realizar o deploy da aplicação será usado uma aplicação já existente, precisaremos criar uma maquina virtual para a aplicação, colocar o código da aplicação em um repositório, vamos automatizar o processo de testes e deploy usando rotinas de CI e CD. Por fim vamos coletar métricas da aplicação usando ferramentas de SRE.

| 🪟 Vitrine.Dev |     |
| -------------  | --- |
| :sparkles: Nome        | **Challenge DevOps**
| 💻 Tecnologias | java, terraform, ansible, CI/DC
| :rocket: URL         |
| :fire: Desafio     | [Challenge DevOps 2]([https://](https://www.alura.com.br/challenges/devops-2))

<!-- Inserir imagem com a #vitrinedev ao final do link -->
![Simbolo do infinito com processos DevOps](https://img.mandic.com.br/2018/06/Devops-o-que-e-DevOps-significado.png?rel=outbound#vitrinedev)

## 📃 Detalhes do projeto

## ⚙️ Funcionalidades

- Semana 1  [X] Familiarizando com a aplicação, criando infra aws com terraform e testando a applicação;
- Semana 2  [X] Rotina CI/CD com github actions;
- Semana 3  [] ;
- Semana 4  [] .


## Semana 1

Serviços feitos da AWS criados pelo terraform:

- 1 vpc
- 2 subnets(public e private)
- 1 db subnet group
- 1 security group (dev e prod)
- EC2 (com SO Amazon Linux)
- RDS (com MySQL)


## Na VM eu realizei os passos na seguinte ordem:

>   yum update


>   yum install maven git -y


>   git clone https://github.com/rcaneppele/2771-spring-boot.git


>   chmod -R 777 2771-spring-boot


>   cd 2771-spring-boot/


## para pular a parte de test

>   mvn clean package -DskipTests ## para pular a parte de test

## indo direto a produção 

>   java -Dspring.profiles.active=prod -DDATASOURCE_URL=jdbc:mysql://<url-db>/vollmed_api -DDATASOURCE_USERNAME=<nomedb> -DDATASOURCE_PASSWORD=<senhadb> -jar target/api-0.0.1-SNAPSHOT.jar


## Semana 2

-   Criar Pipeline de CI/CD com Github Actions;  
-   Realizar rotina de testes já presentes na API;

