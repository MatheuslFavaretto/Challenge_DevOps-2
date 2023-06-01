pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
        BRANCH_NAME = credentials('BRANCH_NAME')
        AWS_KEY = credentials('AWS_KEY')
        AWS_KEY_PUB = credentials('AWS_KEY_PUB')
        ENV = "${env.BRANCH_NAME == 'master' ? 'PROD' : 'DEV'}"
        BRANCH = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/Challenge_DevOps.git', branch: 'main'
            }
        }

        stage('Create Credential File') {
            steps {
                script {
                    def awsKey = credentials('AWS_KEY')
                    writeFile file: 'infra/aws/env/dev/aws-key', text: awsKey
                    def awsKeypub = credentials('AWS_KEY_PUB')
                    writeFile file: 'infra/aws/env/dev/aws-key.pub', text: awsKeypub
                }
            }
        }


        stage('Infrastructure Creation or Update') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Infrastructure Destroy') {
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
