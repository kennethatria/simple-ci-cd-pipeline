pipeline {  
      agent { dockerfile true }
      stages {
            stage('Build Docker Image') {
                when { branch 'staging' }
                steps {
                    script {
                        app = docker.build("katria47/ci-test-cd")
                        app.inside {   
                            try{
                            sh 'echo $(curl http://localhost:8080)'
                            }catch(err){
                            echo "Failed: ${err}"
                            }      
                        }   
                    }
                }                
            }
            stage('Push Docker Image') {
                when { branch 'staging' }
                steps {
                    script {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {            
                            app.push("${env.BUILD_NUMBER}")            
                            app.push("latest")        
                        } 
                    }
                }
            } 
      }    
}
