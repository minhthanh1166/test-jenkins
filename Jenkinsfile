pipeline {
  agent any 

  stages {
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t demo-jenkins:latest .'
      }
    }
    stage('Run Container') {
      steps {
        sh 'docker run -rm demo-jenkins:latest'
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
      echo 'hien ca thanh cong va that bai deu chay'
    }
  }
}
