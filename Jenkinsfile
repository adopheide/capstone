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
            steps {
                sh 'docker -v'

                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh "docker build -t ${registry} ."
                sh "docker tag ${registry} ${registry}"
                sh "docker push ${registry}"
      }
            }
        }


    }
}