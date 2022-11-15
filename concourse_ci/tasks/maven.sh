#!/bin/bash

set -e
cd repo
mvn clean package
#cp -R ./target ../concourse-demo-repo-out
cp -a * ./repo