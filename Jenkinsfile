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
           sh 'docker login -u AWS -p eyJwYXlsb2FkIjoiMjdQbUt2ak5aOWJqaFFualJrWlRlcE8rblRqcXRIWDM0VkUrWkJMUEJGVlFHcFpxTC83bEtCbk5aZ1grTmNYMVhWUjJlWThrU1pCRmdFc3A4bGxxR0RrKzhMZC8wbWZzL3VmclZ0OUlUUWloSHB0VVY1Z2wzWEJod1ZJUW1vNVFnbFRPNUNtSnFXUnhsM3B3VEROVVdvUVM2eGw1elQ2bVU3UjJLYXB1aE9zMklRenlOSmdJVURCQzIyYkZxR0V1aTZmQXdHN0pvbWRqeXorM1RzRUtpSGMrV2ttV290cUtCQ0lvdWZMSVVCSUtranFMRXgxNXpmOEZjZXc4OTFmYnM4eFhHQjhsZE4yeXZ0eEtDdkh3SkRXeG9Ob1VqbjdHWkZhcGkzYzJWbkVWKzAzbC9vN0FVZ2c1aU4vOGl0cW93TEVWTWk5bjdGaDRSRHExN05OK3ZLbXI1N3V0dlNYRXh0ampEWkhmZFExWFF2eHBPMFV4WUs0TEpkYk9lSHpjc0dkbE1aY2FHZGo3a3pEOHA0Uk94OE9sZnZJMEIxa09FTGtkeVN0MmMrWEpWeWE3aVp4aTUzZUdMckRlbjU5MjVpMWZQWWNRQVZaTE5OR1VacmlIcDBtankrUE5KVGFWTGsxRFBwdzNyeVNocmxYYUFlNmpKYkJoL05qaXFaTTB3aEQwS09LbGRHN3dVNlBMS0U5d05oK0RYckNSKzlrTmErOVJ1emRrNDExNVJBTVBBa29HSWVtdEpoRzBMRjVDdHNBUTkvQ3R4dHBaUmhRQXowN3U5eWF1K1k1bWhWTVZFai9yUUpxbDBZNGdCdTVES2x2ZjIxVVFSc1d0OEdvazQ1VTdpYXFSZTZEMjhzQ01nWFZYaExJMWJ4QXJpNWZod2VWS000SWhJNk1tL1htYmRrUkFSSnJEM2lkcUlkT1ZHSU15allTV0FxN2FubWxtQ2JFMzhLSkdValMrMEIrRmp4dXpiajdtb3U0S21JWGRwN2ROWHlRNUdXNzdRUTJWZW1ndW9NSWdxRmk5dnhYR2lWWkc4S1Z5bFRpMWM5UXA2U1hZVW5NeFBvREJUZzhGdXNpL3plUkVWVXY1Y09INnpsMFJqdVVUdHVXQWRxL2lTQkdVY2V5allETE5yajdNRjV4V0hReVBuQzFSL010QkVSM3pqcXlvQkpaK200Y2RqbEwvQzFRNGpVNm8xYUdwZktsWnM3UjN6Tm5zK0VldWpldHVXdm9PQ1pJL1VzKy9RMVAvN2tjeG1KaUQ4RlVVb3JCakNLdjRSbTNCY0lTNXdCcWMzZ3l3SjVIUEQ0TS81VnRxUkI1MmFHenQzdEhqM2NNNzc4d003dVFhekpGTkpzZURNWVU1VldtSWJmakdwQT09IiwiZGF0YWtleSI6IkFRRUJBSGh3bTBZYUlTSmVSdEptNW4xRzZ1cWVla1h1b1hYUGU1VUZjZTlScTgvMTR3QUFBSDR3ZkFZSktvWklodmNOQVFjR29HOHdiUUlCQURCb0Jna3Foa2lHOXcwQkJ3RXdIZ1lKWUlaSUFXVURCQUV1TUJFRUROYTN6TzVuVExwREVvdzNtZ0lCRUlBN3pCUkRpSndYNXZ4K1V6VDE5R2kyKy94SkV4UkYxaXkrUWVTUWk0dEZuSUU3U01JQjhBVGVDRWN6YzQ5NkFkZDNlRGJ0b0kxNkhPR1dWQ0E9IiwidmVyc2lvbiI6IjIiLCJ0eXBlIjoiREFUQV9LRVkiLCJleHBpcmF0aW9uIjoxNjY4ODAwODQ0fQ== 715196779724.dkr.ecr.us-east-1.amazonaws.com/jenkins-test'
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
