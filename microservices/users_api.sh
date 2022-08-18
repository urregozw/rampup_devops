#!/usr/bin/env bash
echo "Coloring"
B='\033[0;34m'

sudo apt-get update
echo "Installing Git.."
sudo apt-get install -y git
git clone https://github.com/bortizf/microservice-app-example.git
cd microservice-app-example/

echo -e "${B}Compiling SpringBoot project..."
cd users-api/
./mvnw clean install
JWT_SECRET=PRFT SERVER_PORT=8083 java -jar target/users-api-0.0.1-SNAPSHOT.jar &


echo -e "${B}JOBS RUNNING..."
jobs -l