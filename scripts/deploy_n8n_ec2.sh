#!/bin/bash
set -e

echo "🔐 Starting EC2 deployment..."

# Ensure Docker is installed
sudo apt update
sudo apt install -y docker.io docker-compose

# Enable Docker on boot
sudo systemctl enable docker
sudo systemctl start docker

# Set up persistent n8n container
mkdir -p ~/.n8n

docker stop n8n || true
docker rm n8n || true

docker run -d --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=${N8N_USER} \
  -e N8N_BASIC_AUTH_PASSWORD=${N8N_PASS} \
  -e N8N_HOST=${N8N_HOST} \
  -e N8N_PORT=5678 \
  -e N8N_PROTOCOL=https \
  -e VUE_APP_URL_BASE_API=https://${N8N_HOST} \
  --restart unless-stopped \
  n8nio/n8n

echo "🚀 n8n deployed to https://${N8N_HOST}:5678"
