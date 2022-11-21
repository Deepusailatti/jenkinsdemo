pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        //sh 'docker build -t jenkins-test:latest .'
        sh 'docker build -t deepusai/jenkins-test:""$GIT_COMMIT"" .'
      }
    }
    
    stage ('Publish to DockerHub') {
      steps {
        withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
          //sh 'docker tag jenkins-test:""$GIT_COMMIT""715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
          sh 'docker tag jenkins-test:latest 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
          //sh 'docker image push jenkins-test:715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
          //sh 'docker push 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
          sh 'docker push deepusai/jenkins-test:""$GIT_COMMIT""'
         }
       }
     }
 
     
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        //withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'eu') {
         withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          //sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           sh 'docker login -u AWS -pey JwYXlsb2FkIjoiWWpEcWZUVTlTOStlRTJVQzZLSWxXaklISFgva1RxZTRwbkRwYU9tUGlaMUhGWm5qRjd0bzRQM25LbDkwY1RaU3I2dDA3LzE1OVpCeWRTWnNtcndFRGZFSVBPMlZzaTE1RmhRbytxU1k0d0x5VG9sWUNDa0NranVha0Nxc2EyMmczMzNMM2ZMc0cxekFoUFAyeWJVb0RoSy9IWGc0RTZmbExLN3JWcGZVREFQR3dTcnJ6QWlRc29hdGpHeURQS0tZV29OcVBRRGdiMkFtYW54dXk4SXBnK1ZIMjRzZ0pvQktoRkwyTnNlQUVRUGJMVlh6a2hzSzdJbThIa1VMRUpzSVk4SU84ZEZqVG1UbzhWSmVmakQvWld5QXo1WVF3eDcvRUMrc1YzYVNSTVY5a3FjWjU1Q1Y0VkcyQ3V2c1dDQ2l0Z1UxeVgwYnEzVmRkc3FtTlEwblZBeHpKQUZLL0pJWTlocHJINXF5cDZjd1ArYUk4Q21DK1I3aTROTXVlempXZ0p3ME9OTkJrS2VCaS9CNUd4SXVZQm9idERmRCtzd3YvNFVsSWVGWDJOTkI1Y25mZ1JrOTUyUXRueHczYThNTE8yWXo5c1BmMnh2VForWkVYZ3lkdUlEdUczTXc4aFlQMDNzQkZhZEErMlQvVFRGMWltbUk2ZlV1Mnk3VGNEVDdZMHZRd1RYWG9FNWxvZGFBOXdtR2swUUdPTnl4ZVJsQmJPTUhMQkowK21UUVdFOThZaGpWM2xKK3BnN3U3ejNaQTZQa0RtVGJBVklxdlNVb1ArNG9CZFFEWGZyZzczNThkc28yTVlwOFFRSVBKRVlUV1ZqM2pkTUtEdVozMFY4MjBqTGY1Q3RmdzJ6UkpaMGh4NitGU0FIZVNyb3dLR2h4dVJyUHVMaldQZUVJTGU5YXhPbWdPZW5wVlJ6ZVJrbktXZXVldlI1OS84SFFXZEJRV0ExV2kxM1RSN0RpWkZSUklyeHQySUZrajROZTI2L1dqWjBjNkk1MDE3WHZCdFJ4VDFnL3d0SncwMDRmRTBFUXJDUHAzRkZGTUZVODZJbjFTMy8rNnEyek00VEYxR0JYaGdOUkJWZTZDUWwzVmQ2ZE1xM1V4SHdLREdMQmFWcUZiSzJVQ09VcTl3Uk1jc1NkN2ZUbS94YjZLdXoydHIxbWp3YytsLzdpeXd2NVpMUkVNUHBUMmhpanNvSmxhdlJRTVJGNTNqbnQzOHlsVXczQ01OTzkyRno2RlJ6dFNBNW40YURFdHZQQUtOQVN3d3dwZkZXbDV5ai8yZkVIdm1DMUtIMUpjeUF2MDVUUy9MY0VWeHlJc09ubG96dU4zSERzVXpvK2dZN1QvazlBbUNRakRaMnhhMU5GRlJxUGh6RUI4OXpnTWU4akIvektQNGMzV0E9PSIsImRhdGFrZXkiOiJBUUVCQUhod20wWWFJU0plUnRKbTVuMUc2dXFlZWtYdW9YWFBlNVVGY2U5UnE4LzE0d0FBQUg0d2ZBWUpLb1pJaHZjTkFRY0dvRzh3YlFJQkFEQm9CZ2txaGtpRzl3MEJCd0V3SGdZSllJWklBV1VEQkFFdU1CRUVERzZ6UmZBSFBiSFRFNTl4eEFJQkVJQTdHcHZML0VhVXVKZkYrSUtDTUU3WGVMdjNvRnNPWVBYQXpzM3RRSUxmYmVlNllQS1laR1E2OS95ekFLQ0s5cDA4NlRVbnB1L3grWm5GMmZrPSIsInZlcnNpb24iOiIyIiwidHlwZSI6IkRBVEFfS0VZIiwiZXhwaXJhdGlvbiI6MTY2OTA3NjQyMH0 == 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test'
          // sh './root/ecr-push.sh'
           //sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1)'
           //sh("eval \$(aws ecr get-login --no-include-email | sed 's|https://||')")
           //sh 'aws ecr get-login-password --region us-east-1 --no-include-email | docker login --username AWS --password-stdin 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'docker login --username AWS --password-stdin 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'aws ecr get-login-password | docker login --username AWS --password-stdin 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'docker login -u AWS -p eyJwYXlsb2FkIjoibkZ3V2tWVTdFZmFPZkZWZy9rSmwrSUUxVHV6RFRTZnlMb0ZuMG9MYnB3bGl3SVNIOHNBTDA4d2FHUWlHVEJ3MUQrSlBaV1dQcndGbzBpTzF6dSs1ZmtxR3ZKd2huL3FRYVVmSFlQcjErWUFFYzdYWC85TDBxeHJwWm1QaFZ1QWJvMHR6U0plSHFIRWhRS2lCQnRkTEhlT1JBaFl1NFd2TTFWYVJWMStVTkwvQnhyV3AxZE9IN0pBWlFUK3FHRERGbGtLS2g5RGFoRnB1TmlvUVVxNVpMeXMrbVRMUG43R2lSWmxHNTdLZXhwTjJXUGFwMDI3N3JQUnVHUDJwWmkyc3dIeTBIaFVSR0JKVWxnL2huT0RZa0x0Rnh6SE5tczBpNmxHQVl1dVl5UUt4VHF1ZksrdzFiSTdnL0owVXltdkxtK0pTTlFCb2tiRHNXTkIzZnhXZkpvSGduMXFzSzBmTkk4YWFyeWo2dVRjQzBpN3dnQm9RYUdZVDYzekZJRVpCY1NVc1h3YkYvbmVqalNwVzVNbTVlSHhIbTZmTUtJcWxMYkRja1ZXcE5BTWdKaURkZGQrSXVmSGJvOTVJMUZmdG85NnJLKzJQSisxTUpldjlPRVdaVDNCU1pvOE9zc3lpMGo3ZXlreVI4Y21KanFEUG9iVlp4c3ROaXdWcUU4My9NYXRjRGJYTEJBQXdkMWNRTVp4QlRrcUxVOXZweDk0dFV6NEJmWEdoTHFqeWNKWkw3cjhyNnlGbU95RXBGRndyQlpTSy9wVWVERkJxYXVsQlprazNnT2JGN0NlVWsxL0x4TEdWUUZqWElNSTVLbkdjcmh1c1VJQkZSQTNxenVqWVliejZ3OW10R1FMZElXbFkyUG1XUklCZGJRMVpxODllbk0zbVlVcGE4Vko4Q09nYXpNTVBiaXhpWHlSdVlvZ0FMaXhKUXFweEtoTkdOVDBRZ2hId0YwU0Z6ZWErQ21qSkpyblRQbXBvdXlacm5kSHFJNlU5NmtQeGZLaGljWEFrMWRhREZMaTFKeXRMYzZPVXdkTHdWOHFBT3Z0bmF6aHlML0FjdXF0ZzR2Wnh3RVVLa01hOXI0ZGd5UzdEdmdWdTVVY3dlVW5SRWJBRjRTSVpEM2YzNHVLYUFMcy9WYzAzamZJL0hlY3QzMlZKZ3EydklnOHR5L1JZcDFYcVQ4bnBGeXIxMjBKem5MdGlrbHUwRnlaRGlIMmlxUnNVYkEwM1cvZWkreTNZeHpTTFlqSVo2VU55S3FRS2YxbWFCRXp2cXRCRXNoV3pseXducis5MXZRTWtpSFAybEFab1d2RWx4bTFKUE1QcHhLclovMHozMnVGVnVDazVwcXY5TzFQWlppTGFRRGRIR2g4WC91V0RmZz09IiwiZGF0YWtleSI6IkFRRUJBSGh3bTBZYUlTSmVSdEptNW4xRzZ1cWVla1h1b1hYUGU1VUZjZTlScTgvMTR3QUFBSDR3ZkFZSktvWklodmNOQVFjR29HOHdiUUlCQURCb0Jna3Foa2lHOXcwQkJ3RXdIZ1lKWUlaSUFXVURCQUV1TUJFRURMckRWeHFxN1djaWZZZkNrd0lCRUlBN3VmYkRUUWY5NmJ3Q3ViUDhuVkphZ0FFRzNER3MwRUV1NkdYSzgxSTA5ZFFRZWgzc0R4OHprVnRqTU9HcmFCYjMrcDdMbTg3aVlTS0RFOUE9IiwidmVyc2lvbiI6IjIiLCJ0eXBlIjoiREFUQV9LRVkiLCJleHBpcmF0aW9uIjoxNjY4NzIzNDAyfQ== none 715196779724.dkr.ecr.us-east-1.amazonaws.com'
           //sh 'docker login --username AWS --password-stdin public.ecr.aws/b2i5j8y5'
           //sh "eval $(aws ecr get-login --no-include-email | sed 's|https://||')"
           //sh 'aws ecr get-login-password --region us-east-1 | docker login -u AWS -p eyJwYXlsb2FkIjoibkZ3V2tWVTdFZmFPZkZWZy9rSmwrSUUxVHV6RFRTZnlMb0ZuMG9MYnB3bGl3SVNIOHNBTDA4d2FHUWlHVEJ3MUQrSlBaV1dQcndGbzBpTzF6dSs1ZmtxR3ZKd2huL3FRYVVmSFlQcjErWUFFYzdYWC85TDBxeHJwWm1QaFZ1QWJvMHR6U0plSHFIRWhRS2lCQnRkTEhlT1JBaFl1NFd2TTFWYVJWMStVTkwvQnhyV3AxZE9IN0pBWlFUK3FHRERGbGtLS2g5RGFoRnB1TmlvUVVxNVpMeXMrbVRMUG43R2lSWmxHNTdLZXhwTjJXUGFwMDI3N3JQUnVHUDJwWmkyc3dIeTBIaFVSR0JKVWxnL2huT0RZa0x0Rnh6SE5tczBpNmxHQVl1dVl5UUt4VHF1ZksrdzFiSTdnL0owVXltdkxtK0pTTlFCb2tiRHNXTkIzZnhXZkpvSGduMXFzSzBmTkk4YWFyeWo2dVRjQzBpN3dnQm9RYUdZVDYzekZJRVpCY1NVc1h3YkYvbmVqalNwVzVNbTVlSHhIbTZmTUtJcWxMYkRja1ZXcE5BTWdKaURkZGQrSXVmSGJvOTVJMUZmdG85NnJLKzJQSisxTUpldjlPRVdaVDNCU1pvOE9zc3lpMGo3ZXlreVI4Y21KanFEUG9iVlp4c3ROaXdWcUU4My9NYXRjRGJYTEJBQXdkMWNRTVp4QlRrcUxVOXZweDk0dFV6NEJmWEdoTHFqeWNKWkw3cjhyNnlGbU95RXBGRndyQlpTSy9wVWVERkJxYXVsQlprazNnT2JGN0NlVWsxL0x4TEdWUUZqWElNSTVLbkdjcmh1c1VJQkZSQTNxenVqWVliejZ3OW10R1FMZElXbFkyUG1XUklCZGJRMVpxODllbk0zbVlVcGE4Vko4Q09nYXpNTVBiaXhpWHlSdVlvZ0FMaXhKUXFweEtoTkdOVDBRZ2hId0YwU0Z6ZWErQ21qSkpyblRQbXBvdXlacm5kSHFJNlU5NmtQeGZLaGljWEFrMWRhREZMaTFKeXRMYzZPVXdkTHdWOHFBT3Z0bmF6aHlML0FjdXF0ZzR2Wnh3RVVLa01hOXI0ZGd5UzdEdmdWdTVVY3dlVW5SRWJBRjRTSVpEM2YzNHVLYUFMcy9WYzAzamZJL0hlY3QzMlZKZ3EydklnOHR5L1JZcDFYcVQ4bnBGeXIxMjBKem5MdGlrbHUwRnlaRGlIMmlxUnNVYkEwM1cvZWkreTNZeHpTTFlqSVo2VU55S3FRS2YxbWFCRXp2cXRCRXNoV3pseXducis5MXZRTWtpSFAybEFab1d2RWx4bTFKUE1QcHhLclovMHozMnVGVnVDazVwcXY5TzFQWlppTGFRRGRIR2g4WC91V0RmZz09IiwiZGF0YWtleSI6IkFRRUJBSGh3bTBZYUlTSmVSdEptNW4xRzZ1cWVla1h1b1hYUGU1VUZjZTlScTgvMTR3QUFBSDR3ZkFZSktvWklodmNOQVFjR29HOHdiUUlCQURCb0Jna3Foa2lHOXcwQkJ3RXdIZ1lKWUlaSUFXVURCQUV1TUJFRURMckRWeHFxN1djaWZZZkNrd0lCRUlBN3VmYkRUUWY5NmJ3Q3ViUDhuVkphZ0FFRzNER3MwRUV1NkdYSzgxSTA5ZFFRZWgzc0R4OHprVnRqTU9HcmFCYjMrcDdMbTg3aVlTS0RFOUE9IiwidmVyc2lvbiI6IjIiLCJ0eXBlIjoiREFUQV9LRVkiLCJleHBpcmF0aW9uIjoxNjY4NzIzNDAyfQ== none -e 715196779724.dkr.ecr.us-east-1.amazonaws.com'
          //sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/b2i5j8y5' //985729960198.dkr.ecr.eu-west-2.amazonaws.com'
          sh 'docker build -t jenkins-test .'
          sh 'docker tag jenkins-test:latest 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
          sh 'docker push 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test:""$GIT_COMMIT""'
         }
       }
    }
  stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml'
       }
     }
  }
}
