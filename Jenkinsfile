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
        stage('Start container') {
          steps {
        sh 'docker compose up -d --no-color --wait'
        sh 'docker compose ps'
       }
     }
   

 
    
       
        //  stage('Push Docker Image to Docker Hub') {
        //      steps {
        //          sh 'docker login --username=$DOCKER_HUB_USERNAME --password=$DOCKER_HUB_PASSWORD'
        //          sh 'docker tag fullstack-app:latest $DOCKER_HUB_USERNAME/fullstack-app:$BUILD_NUMBER'
        //          sh 'docker push $alpha04/app-01:$BUILD_NUMBER'
        //           }
        //     }
         
         
       }
          
    }
    
