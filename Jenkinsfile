node {
    stage('Build') {
        withCredentials([string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) {
            git url: 'https://github.com/jscheel42/docker-build.git'
            sh 'docker login --username jscheel42 --password $DOCKERHUB_PASSWORD'
            sh 'bash build.sh push'
        }
    }
}