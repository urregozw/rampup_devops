#!/usr/bin/env bash
echo "Coloring"
B='\033[0;34m'


sudo apt-get update
echo "${B}Installing Git.."
sudo apt-get install -y git
git clone https://github.com/bortizf/microservice-app-example.git
cd microservice-app-example/

echo -e "${B}Installing Node and NPM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 8.17
npm config set user 0
npm config set unsafe-perm true

cd frontend/
echo -e "${B}Running FrontEnd project in $PWD"
npm install
npm run build
PORT=8080 AUTH_API_ADDRESS=http://127.0.0.1:8000 TODOS_API_ADDRESS=http://127.0.0.1:8082 npm start > log_frontEnd.txt 2>&1 &


echo -e "${B}JOBS RUNNING..."
jobs -l