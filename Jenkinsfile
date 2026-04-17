pipeline {
  agent: any 

  stages {
    stage('Checkout') {
      steps {
        branch: 'main', url: 'https://github.com/minhthanh1166/test-jenkins.git'
      }
    }
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
        sh 'python3 main.py'
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
