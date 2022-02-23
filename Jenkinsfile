node {    
      def app     
            stage('Clone repository') {               
            checkout scm    
      }     
      stage('Build image') {         
            app = docker.build("katria47/ci-test-cd")    
      }     
      stage('Test image') {           
            app.inside {   
                  try{
                        sh 'curl http://localhost:4200'
                  }catch(err){
                        echo "Failed: ${err}"
                  }      
      }    
      }     
      stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {            
                  app.push("${env.BUILD_NUMBER}")            
                  app.push("latest")        
            }    
      }
}
