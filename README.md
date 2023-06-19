# 💻 Sobre o projeto

Fazer o deploy de uma aplicação através de uma maquina virtual.

Para realizar o deploy da aplicação será usado uma aplicação já existente, precisaremos criar uma maquina virtual para a aplicação, colocar o código da aplicação em um repositório, vamos automatizar o processo de testes e deploy usando rotinas de CI e CD. Por fim vamos coletar métricas da aplicação usando ferramentas de SRE.

| :placard: Vitrine.Dev |     |
| -------------  | --- |
| :sparkles: Nome        | **Challenge DevOps**
| :label: Tecnologias | Java, Terraform, Jenkins, AWS, Docker, Ansible e Slack 
| :rocket: URL         |
| :fire: Desafio     | [Challenge DevOps 2](https://www.alura.com.br/challenges/devops-2)

<!-- Inserir imagem com a #vitrinedev ao final do link -->
![Simbolo do infinito com processos DevOps](https://img.mandic.com.br/2018/06/Devops-o-que-e-DevOps-significado.png?rel=outbound#vitrinedev#vitrinedev)

## 📃 Detalhes do projeto

-   Na branch 'main' está o projeto finalizado com a rotina CI/CD no Jenkins. Nesse ambiente, as etapas declarativas incluem: Checkout SCM, Checkout Source, Build Docker Image - DB, Push to Docker Hub, Create Credentials File, Create or Update Infrastructure, Run Ansible, Wait e Destroy Infrastructure. Foi utilizado Infrastructure as Code (IaC) com Terraform, utilizando módulos remotos, para criar a infraestrutura na AWS e implantar uma instância EC2. Além disso, foi implementada a integração com o Slack para notificações durante a rotina CI/CD.

    Caso a pipeline seja executada como ambiente de desenvolvimento (DEV), a infraestrutura criada pela IaC será destruída após a conclusão da pipeline. No entanto, caso seja executada como ambiente de produção (PROD), o ambiente não será destruído automaticamente, permitindo a continuidade do ambiente para produção.

-   A branch 'DEV_local' para testar a aplicação e sua conexão com o banco de dados no ambiente local. Isso proporcionou um ambiente de desenvolvimento local para verificar o funcionamento correto da aplicação antes de prosseguir para os testes no ambiente de desenvolvimento CI/CD.


## ⚙️ Funcionalidades

- [x] Semana 1 Familiarizando com a aplicação, criando infra aws com terraform e testando a applicação;
- [x] Semana 2 Rotina CI/CD com Jenkins;
- [x] Semana 3/4 Monitoramento e SRE do sistema em produção;


### Semana 1 IaC

Serviços feitos da AWS criados pelo Terraform:

-   Utilizado modulos remotos para crair o ambiente da applicação;
-   Ambiente Criados DEV e PROD;
-   Utilizaer um Docker para o DB;


### Semana 2 CI/CD

-   Criado Pipeline de CI/CD com Jenkins;  
-   Realizado create e push da imagem DB_mysql para o DockerHub
-   Realizar rotina de testes já presentes na API;


### Semana 3 e 4 Monitoramento e SRE  

-   Utilizei o Prometheus para coletar métricas;
-   Utilizei Grafana para visualizar métricas coletadas;
-   Utilizei o docker-compose para subir o Prometheus eo Grafana;
-   Como a aplicação não ira ser rodar em um conteiner eu optei por por salvar os arquivos de logs em arquivos .gz conforme o tamanho e lifecycle escolhidos;


## Jenkins CI/CD:

![image](https://user-images.githubusercontent.com/116848225/242871769-644e6ba8-a3a3-49bd-8549-6063d3d5789c.png)

## Grafana Dashboard:

![image](https://user-images.githubusercontent.com/116848225/242857039-e6f87c7c-1d98-4da2-8031-74ff3bfc8d0b.png)

## Prometheus target:

![image](https://user-images.githubusercontent.com/116848225/242857282-e06f777d-a376-4fad-a831-bf18b79c2b11.png)

## Slack:
![image](https://user-images.githubusercontent.com/116848225/242860021-e888be85-3ac8-48c1-af8f-7954d16805ef.png)

 
-----

## 💻 Sobre a API

Voll.med é uma clínica médica fictícia que precisa de um aplicativo para gestão de consultas. O aplicativo deve possuir funcionalidades que permitam o cadastro de médicos e de pacientes, e também o agendamento e cancelamento de consultas.

Enquanto um time de desenvolvimento será responsável pelo aplicativo mobile, o nosso será responsável pelo desenvolvimento da API Rest desse projeto.

-----

## ⚙️ Funcionalidades

- [x] CRUD de médicos;
- [x] CRUD de pacientes;
- [x] Agendamento de consultas;
- [x] Cancelamento de consultas.

-----

## 🎨 Layout

O layout da aplicação mobile está disponível neste link: [Figma](https://www.figma.com/file/N4CgpJqsg7gjbKuDmra3EV/Voll.med)

-----

## 📄 Documentação

A documentação das funcionalidades da aplicação pode ser acessada neste link: [Trello](https://trello.com/b/O0lGCsKb/api-voll-med)

-----

## 🛠 Tecnologias

As seguintes tecnologias foram utilizadas no desenvolvimento da API Rest do projeto:

- **[Java 17](https://www.oracle.com/java)**
- **[Spring Boot 3](https://spring.io/projects/spring-boot)**
- **[Maven](https://maven.apache.org)**
- **[MySQL](https://www.mysql.com)**
- **[Hibernate](https://hibernate.org)**
- **[Flyway](https://flywaydb.org)**
- **[Lombok](https://projectlombok.org)**

-----

## 📝 Licença

API desenvolvido por [Alura](https://www.alura.com.br) e utilizado nos cursos de Spring Boot.

Instrutor: [Rodrigo Ferreira](https://cursos.alura.com.br/user/rodrigo-ferreira)

-----
