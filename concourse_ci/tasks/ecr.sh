#!/bin/bash

set -e
cd repo
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 657757981076.dkr.ecr.us-east-1.amazonaws.com
docker build -t test .
docker tag test:latest 657757981076.dkr.ecr.us-east-1.amazonaws.com/test:latest
docker push 657757981076.dkr.ecr.us-east-1.amazonaws.com/test:latest