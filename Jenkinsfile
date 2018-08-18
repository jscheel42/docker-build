node {
    stage('Build') {
        withCredentials([
            string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) 
        {
            echo $DOCKERHUB_PASSWORD | docker login --username jscheel42 --password-stdin
            sh './build.sh push'
        }
    }
}