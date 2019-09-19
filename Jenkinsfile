pipeline {
    agent any
    stages {
        stage('Checkout of SCM.') {
            steps {
                sh 'git --version'
                sh 'docker -v'
                
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


    }
}