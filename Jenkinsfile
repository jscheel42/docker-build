pipeline {  
    agent any  
    stages {  
        stage('Build') {
            withCredentials([string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) {
                git url: 'https://github.com/jscheel42/docker-build.git'
                sh 'docker login --username jscheel42 --password $DOCKERHUB_PASSWORD'
                sh 'bash build.sh push'
            }
        }
    }  
    post {  
        always {}  
        success {}  
        failure {  
            mail bcc: '', body: "<b>Example</b><br>\n\<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br>URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "jscheel42@gmail.com";  
        }  
        unstable {}  
        changed {}  
    }  
}