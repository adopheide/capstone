pipeline {
    agent any
    stages {
        stage('Checkout of SCM.') {
            steps {
                sh '''
                    echo "Checking out of GitHub"
                '''
                checkout scm

                sh 'git --version'
                sh 'docker -v'
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
            steps {
                sh '''
                    echo "Building"
                    tidy -q -e ./content/*.html
                '''
            }
        }

    }
}