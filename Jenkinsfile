pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
        BRANCH_NAME = credentials('BRANCH_NAME')
        ENV = "${env.BRANCH_NAME == 'master' ? 'PROD' : 'DEV'}"
        BRANCH = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/Challenge_DevOps.git', branch: 'main'
            }
        }

        stage('Criar Arquivo de Credenciais') {
            steps {
                withCredentials([string(credentialsId: 'AWS_KEY', variable: 'AWS_KEY_VALUE')]) {
                    writeFile file: 'infra/aws/env/dev/aws-key', text: "${AWS_KEY_VALUE}"
                }
                withCredentials([string(credentialsId: 'AWS_KEY_PUB', variable: 'AWS_KEY_PUB_VALUE')]) {
                    writeFile file: 'infra/aws/env/dev/aws-key.pub', text: "${AWS_KEY_PUB_VALUE}"
                }
            }
        }

        stage('Criação ou Atualização da Infraestrutura') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'ls'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Destruir Infraestrutura') {
            when {
                not {
                    expression {
                        return env.ENV == 'PROD'
                    }
                }
            }

            steps {
                script {
                    dir('infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
