pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
        BRANCH_NAME = credentials('BRANCH_NAME')
        AWS_KEY = credentials('AWS_KEY')
        ENV = "${env.BRANCH_NAME == 'master' ? 'PROD' : 'DEV'}"
        BRANCH = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/dev-test.git', branch: 'main'
                sh 'chmod -R 777 .'
            }
        }

        stage('Criar Arquivo de Credenciais') {
            steps {
                withCredentials([string(credentialsId: 'AWS_KEY', variable: 'AWS_KEY_VALUE')]) {
                    writeFile file: 'infra/aws/env/dev/aws-key', text: "${AWS_KEY_VALUE}"
                }
            }
        }

        stage('Criação ou Atualização da Infraestrutura') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'sudo ssh-keygen -y -f aws-key.pub -t rsa -b 4096'
                        sh 'chmod 600 infra/aws/env/dev/aws-key'
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Executando Ansible') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'export ANSIBLE_HOST_KEY_CHECKING=False'
                        sh 'ansible-playbook master.yml -u ec2-user --private-key aws-key -i hosts.yml'
                    }
                }
            }
        }

        stage('Wait') {
            steps {
                script {
                    sleep time: 300, unit: 'SECONDS'
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
