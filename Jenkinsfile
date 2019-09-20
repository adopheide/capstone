def registry = 'adopheide/nginx-capstone'

pipeline {
    agent any
    stages {
        stage('Checkout of SCM.') {
            steps {
                sh 'git --version'
                sh '''
                    echo "Checking out of GitHub"
                '''
                checkout scm
            }
        }
        stage('Lint HTML.') {
            steps {
                sh '''
                    echo "Linting"
                    tidy -q -e ./content/*.html
                '''
            }
        }
        stage('Build Docker Container.') {
            environment {
                DOCKER_CREDS = credentials('docker')
            }
            steps {
                sh 'docker -v'
                sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW"
                sh "docker build -t ${registry} ."
                sh "docker tag ${registry} ${registry}"
                sh "docker push ${registry}"
            }
        }
        stage('Upload to AWS.') {
            steps {
                sh 'echo "Connecting to AWS"'
                withAWS(region: 'us-east-2', credentials: 'udacity1') {
                    sh 'echo "index.html">index.html'
                    s3Upload(file:'/var/lib/jenkins/workspace/static_master/index.html', bucket:'dopheide-jenkins-s3', path:'', acl:'PublicRead')
                }
                sh 'echo "Upload complete"'
            }
        }
        stage('AWS Deployment.') {
            steps {
                sh 'echo "Connecting to AWS"'
                withAWS(region: 'us-east-2', credentials: 'udacity1') {
                    sh "aws ec2 describe-security-groups"
                }
                sh 'echo "Upload complete"'
            }
        }
    }
}