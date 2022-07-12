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
JWT_SECRET=PRFT SERVER_PORT=8083 java -jar target/users-api-0.0.1-SNAPSHOT.jar > log_usersApi.txt 2>&1 &


echo -e "${B}Compiling GOLANG project..."
cd ..
cd auth-api/
export GO111MODULE=on
go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
go mod tidy
go build
JWT_SECRET=PRFT AUTH_API_PORT=8000 USERS_API_ADDRESS=http://127.0.0.1:8083 ./auth-api > log_authApi.txt 2>&1 &

echo -e "${B}Running TODOS project..."
cd ..
cd todos-api/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 8.17
npm install
JWT_SECRET=PRFT TODO_API_PORT=8082 npm start > log_todos.txt 2>&1 &


echo -e "${B}Running FrontEnd project..."
cd .. 
cd frontend/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 8.17
npm config set user 0
npm config set unsafe-perm true
npm install
npm run build
PORT=8080 AUTH_API_ADDRESS=http://127.0.0.1:8000 TODOS_API_ADDRESS=http://127.0.0.1:8082 npm start > log_frontEnd.txt 2>&1 &


echo -e "${B}Running Log Message processor project..."
cd ..
cd log-message-processor/
pip3 install -r requirements.txt
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py > log_Logmessage_processor.txt 2>&1 &



echo -e "${B}JOBS RUNNING..."
jobs -l

