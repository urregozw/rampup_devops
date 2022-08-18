#!/usr/bin/env bash
sudo apt-get update
sudo apt install redis-server -y
redis-server --version