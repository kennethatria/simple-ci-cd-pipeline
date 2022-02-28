# simple-ci-cd-pipeline
    Setting up ci and cd pipelines using jenkins and github

  - Jenkinsfile is used to define 4 stages to ci-cd pipeline. These stages are as follows:<br />
      Build Stage: This stage looks at building image based on Dockerfile.<br />
      Test Image: This stage looks to applying health checks/tests on image.<br />
      Push Stage: This stage looks at pushing built image to repository.<br />
      Deploy To Instance Stage: requests for users input to deploy update to target instance.<br />
   
  - Updating yaml file for git actions
      With the help of git actions, two additional steps were implmented in this CI-CD process. This are as follows:<br />
          1) Automatic merging of branches into staging branch.<br />
          2) Checking for security vulnerabilities using Synk.<br />
      
