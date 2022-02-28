# simple-ci-cd-pipeline
setting up ci and cd pipelines using jenkins and github

 - Jenkinsfile has 4 stages namely:
      Build Stage: This stage looks at building image based on Dockerfile
      Test Image: This stage looks to applying health checks/tests on image
      Push Stage: This stage looks at pushing built image to repository
      Deploy To Instance Stage: requests for users input to deploy update to target instance
   
 - Updating yaml file for git actions
      With the help of git actions, two additional steps were implmented in this CI-CD process. This are as follows:
          1) Automatic merging of branches into staging branch.
          2) Checking for security vulnerabilities using Synk.
      
