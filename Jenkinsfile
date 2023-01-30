pipeline {
  agent any
  stages {
   stage('Checkout') {
            steps {
            checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ALPHA-04/app-1.git']])
            }
       }
         stage('Clone Repository') {
            steps {
            git branch: 'DEV', url: 'https://github.com/ALPHA-04/app-1.git'
            }
        }
    stage('Prune Docker data') {
      steps {
        sh 'docker system prune -a --volumes -f'
      }
    }
    stage('Start container') {
      steps {
        sh 'docker compose up -d --no-color --wait'
        sh 'docker compose ps'
      }
    }
    stage('Run tests against the container') {
      steps {
        sh 'curl http://localhost:3000/param?query=demo | jq'
      }
    }
  }
  post {
    always {
      sh 'docker compose down --remove-orphans -v'
      sh 'docker compose ps'
    }
  }
}
