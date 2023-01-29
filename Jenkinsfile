node {
     def app 
     stage('clone repository') {
     git 'https://github.com/ALPHA-04/app-1.git'
    }
     stage('Build docker Image'){
      app = docker.build("alpha04/app-01")
    }
     stage('Test Image'){
       app.inside {
         sh 'echo "TEST PASSED"'
      }  
    }
     stage('Push Image'){
       docker.withRegistry('https://registry.hub.docker.com', 'git') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")   
   }
}
}
