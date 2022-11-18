#!/bin/bash

Echo "pushing the image to ecr"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 715196779724.dkr.ecr.us-east-1.amazonaws.com
docker build -t jenkins-pipeline .
docker tag jenkins-pipeline:latest public.ecr.aws/b2i5j8y5/jenkins-pipeline:latest
docker push public.ecr.aws/b2i5j8y5/jenkins-pipeline:latest
