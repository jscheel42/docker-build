node {
    stage('Build') {
        withCredentials([string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) {
            sh "echo $DOCKERHUB_PASSWORD | docker login --username jscheel42 --password-stdin"
            sh "bash build.sh push"
        }
    }
}