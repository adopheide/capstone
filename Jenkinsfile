pipeline {
    agent any
    stages {
        stage('Checkout of SCM.') {
            steps {
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
                    tidy -q -e *.html
                '''
            }
        }

    }
}