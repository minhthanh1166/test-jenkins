pipeline {
  agent any 

  stages {
    stage('Run dir') {
      steps {
        sh 'uname -a'
        sh 'whoami'
        sh 'pwd'
        sh 'ls -la'
      }
    }
    stage('Run python') {
      steps {
        sh 'python3 --version'
        sh 'python3 main.py > output.txt'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts artifacts: 'output.txt', fingerprint: true
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
