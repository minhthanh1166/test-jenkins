pipeline {
  agent any 
   environment {
     IMAGE_NAME = 'minhthanh1166/demo-jenkins'
     TAG = 'latest'
     SERVER = 'ubt@10.9.30.101'
   }

  stages {
    stage('Build Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$TAG .'
      }
    }
    stage('Docker Login') {
      steps {
          withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
              sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
          }
      }
    }
    stage('Push Image') {
      steps {
        sh 'docker push $IMAGE_NAME:$TAG'
      }
    }
    stage('Deploy') {
        steps {
            withCredentials([sshUserPrivateKey(credentialsId: 'ssh-server', keyFileVariable: 'SSH_KEY'),
                            usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS'),
                            ]) {
                sh '''
                    ssh -i $SSH_KEY -o StrictHostKeyChecking=no $SERVER "
                        docker pull $IMAGE_NAME:$TAG &&
                        docker stop demo || true &&
                        docker rm demo || true &&
                        docker run -d --name demo $IMAGE_NAME:$TAG
                    "
                '''
            }
        }
    }
  }
  post {
      success {
        echo 'Thanh cong'
      }
      failure {
        echo 'That bai'
      }
      always {
        echo 'Run all that bai and thanh cong'
      }
    }
}
