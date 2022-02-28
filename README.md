# simple-ci-cd-pipeline
    Setting up ci and cd pipelines using jenkins and github

  - Jenkinsfile is used to define 4 stages to ci-cd pipeline. These stages are as follows:<br />
    <ul>
        <li> Build Stage: This stage looks at building image based on Dockerfile </li>
        <li> Test Image: This stage looks to applying health checks/tests on image</li>
        <li> Push Stage: This stage looks at pushing built image to repository</li>
        <li> Deploy To Instance Stage: requests for users input to deploy update to target instance</li>
    </ul>
   
  - Updating yaml file for git actions
      With the help of git actions, two additional steps were implmented in this CI-CD process. This are as follows:<br />
      <ul>
        <li> Automatic merging of branches into staging branch</li>
        <li> Checking for security vulnerabilities using Synk</li>
    </ul>
