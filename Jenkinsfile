node {
    stage('Build') {
        withCredentials([string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) {
            sh 'docker login --username jscheel42 --password $DOCKERHUB_PASSWORD'
            sh 'bash build.sh push'
            echo "hello"
        }
    }
}