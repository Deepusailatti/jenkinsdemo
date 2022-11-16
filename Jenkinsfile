pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t jenkins-pipeline .'
      }
    }
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        //withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'eu-west-2') {
         withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) 715196779724.dkr.ecr.us-east-1.amazonaws.com' //985729960198.dkr.ecr.eu-west-2.amazonaws.com'
          sh 'docker build -t jenkins-pipeline .'
          sh 'docker push 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-pipeline:latest'
         }
       }
    }
  }
}
