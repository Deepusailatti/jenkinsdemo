pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker tag jenkins-test:latest 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:latest.'
      }
    }
    
    stage ('Publish to DockerHub') {
      steps {
        withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
          sh 'docker tag jenkins-pipeline deepusai/jenkinstest'
          sh 'docker push deepusai/jenkinstest'
         }
       }
     }
 
     
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        //withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'eu') {
         withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'docker login --username AWS --password-stdin public.ecr.aws/b2i5j8y5'
          //sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/b2i5j8y5' //985729960198.dkr.ecr.eu-west-2.amazonaws.com'
          sh 'docker build -t jenkins-test .'
          sh 'docker tag jenkins-pipeline:latest public.ecr.aws/b2i5j8y5/jenkins-test:latest'
          sh 'docker push public.ecr.aws/b2i5j8y5/jenkins-test:latest'
         }
       }
    }
  }
}
