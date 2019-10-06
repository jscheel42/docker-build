podTemplate(yaml:"""
apiVersion: v1
kind: Pod
spec:
    containers:
      - name: build
        image: jscheel42/build
        command:
            - cat
        tty: true
        resources:
            requests:
                cpu: 500m
                memory: 1024Mi
        volumeMounts:
          - name: dockersock
            mountPath: "/var/run/docker.sock"
    volumes:  
      - name: dockersock
        hostPath:
          path: /var/run/docker.sock
"""
) {
    node(POD_LABEL) {
        stage('build') {
            container('build') {
                withCredentials([string(credentialsId: 'dockerhub_password', variable: 'DOCKERHUB_PASSWORD')]) {
                    git url: 'https://github.com/jscheel42/docker-build.git'
                    sh 'docker login --username jscheel42 --password $DOCKERHUB_PASSWORD'
                    sh 'bash build.sh push'
                }
            }
        }
    }
    post {  
        failure {  
            emailext subject: "${env.JOB_NAME} build #${env.BUILD_NUMBER} failed",
                body: "${env.BUILD_URL}",
                replyTo: 'jscheel42@gmail.com',
                to: 'jscheel42@gmail.com' 
        }  
    }  
}