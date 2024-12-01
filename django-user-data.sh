#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER 
sudo systemctl start docker
sudo systemctl enable docker
docker pull deepdhiman/notes-app:latest
docker run -d -p 8000:8000 deepdhiman/notes-app:latest
