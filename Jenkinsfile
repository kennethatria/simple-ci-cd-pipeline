node {    
      def app     
            stage('Clone repository') {               
            checkout scm    
      }     
      stage('Build image') {         
            app = docker.build("katria/ci-test-cd")    
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
      stage('DeployToProduction') {
            when {
                  branch 'master'
            }
            steps {
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
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod_ip \"docker run --restart always --name test -p 5050:4200 -d katria47/ci-test-cd:${env.BUILD_NUMBER}\""
                       } 
                  }            
            }    
      }
}
