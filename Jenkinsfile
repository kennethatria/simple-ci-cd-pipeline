node {    
      def app
      stage('Clone repository') {               
            checkout scm    
      }       
      stage('Build image') {  
            when {
                  branch 'staging'
            }       
            app = docker.build("katria47/ci-test-cd")    
      }     
      stage('Test image') {  
            when { 
                  branch 'staging'
            }         
            app.inside {   
                  try{
                        sh 'curl http://localhost:8080'
                  }catch(err){
                        echo "Failed: ${err}"
                  }      
      }    
      }     
      stage('Push image') {
            when { 
                  branch 'staging'
            }
            docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {            
                  app.push("${env.BUILD_NUMBER}")            
                  app.push("latest")        
            }    
      }
      stage('DeployToStaging ') {
            when { 
                  branch 'staging'
            }
            input 'Deploy to Production'
            milestone(1)
            withCredentials([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]){
                 script {
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod_ip \"docker pull katria47/ci-test-cd:${env.BUILD_NUMBER}\""
                  try {
                      sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod_ip \"docker stop ci-test-cd\""
                      sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod_ip \"docker rm ci-test-cd\""
                  } catch (err) {
                      echo: 'caught error: $err'
                  }
                   sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod_ip \"docker run --restart always --name test -p 8080:8080 -d katria47/ci-test-cd:${env.BUILD_NUMBER}\""
                  } 
            } 
      }
}
