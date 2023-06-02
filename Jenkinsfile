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
    
        stage('Build Docker Image - DB') {
            steps {
                dir('infra/db_mysql/') {
                    sh 'sudo docker build -t matheuslfavaretto/db_mysql:v1 .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    dir('infra/db_mysql/') {
                        sh "echo ${DOCKERHUB_PASSWORD} | sudo docker login -u ${DOCKERHUB_USERNAME} --password-stdin"
                        sh 'sudo docker push matheuslfavaretto/db_mysql:v1'
                    }
                }
            }
        }

        stage('Create Credentials File') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_KEY', variable: 'AWS_KEY_VALUE'),
                    string(credentialsId: 'AWS_KEY_PUB', variable: 'AWS_KEY_PUB_VALUE')
                ]) {
                    sh 'echo $AWS_KEY_VALUE > infra/aws/env/dev/aws-key.pem'
                    sh 'echo $AWS_KEY_PUB_VALUE > infra/aws/env/dev/aws-key.pub'
                }
            }
        }

        stage('Create or Update Infrastructure') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'chmod 600 aws-key.pem'
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Run Ansible') {
            steps {
                script {
                    dir('infra/aws/env/dev/') {
                        withEnv([
                            "ANSIBLE_HOST_KEY_CHECKING=False",
                            "ANSIBLE_PRIVATE_KEY_PATH=infra/aws/env/dev/aws-key.pem"
                        ]) {
                            sh 'ansible-playbook -i hosts.yml -u ec2-user master.yml'
                        }
                    }
                }
            }
        }

        stage('Wait') {
            steps {
                script {
                    sleep(time: 600, unit: 'SECONDS')
                }
            }
        }

        stage('Destroy Infrastructure') {
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
