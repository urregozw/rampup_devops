#!/usr/bin/env bash
echo "Coloring"
B='\033[0;34m'


sudo apt-get update
echo "Installing Git.."
sudo apt-get install -y git
git clone https://github.com/bortizf/microservice-app-example.git
cd microservice-app-example/


echo -e "${B}Compiling GOLANG project..."
cd auth-api/
export GO111MODULE=on
go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
go mod tidy
go build
JWT_SECRET=PRFT AUTH_API_PORT=8000 USERS_API_ADDRESS=http://127.0.0.1:8083 ./auth-api &


echo -e "${B}JOBS RUNNING..."
jobs -l