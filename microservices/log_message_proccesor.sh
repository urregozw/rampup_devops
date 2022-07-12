#!/usr/bin/env bash
echo "Coloring"
B='\033[0;34m'



sudo apt-get update
echo "Installing Git.."
sudo apt-get install -y git
git clone https://github.com/bortizf/microservice-app-example.git
cd microservice-app-example/

echo -e "${B}Running Log Message processor project..."
cd log-message-processor/
pip3 install -r requirements.txt
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py &


echo -e "${B}JOBS RUNNING..."
jobs -l