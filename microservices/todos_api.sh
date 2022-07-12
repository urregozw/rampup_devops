#!/usr/bin/env bash
echo "Coloring"
B='\033[0;34m'

sudo apt-get update
echo "Installing Git.."
sudo apt-get install -y git
git clone https://github.com/bortizf/microservice-app-example.git
cd microservice-app-example/

echo -e "${B}Installing Node and NPM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 8.17


echo -e "${B}Running TODOS project..."
cd todos-api/
npm install
JWT_SECRET=PRFT TODO_API_PORT=8082 npm start &


echo -e "${B}JOBS RUNNING..."
jobs -l