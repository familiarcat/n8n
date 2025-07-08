#!/bin/bash
# Usage: ./deploy_n8n_ec2.sh <EC2_PUBLIC_IP>
set -e
EC2_IP="$1"
echo "🚀 Deploying Pie Guy n8n to $EC2_IP..."

# Sync full project directory including mock_data and workflow
scp -i ~/.ssh/AlexKeyPair.pem -r . ec2-user@$EC2_IP:~/n8n/

# Restart Docker deployment remotely
ssh -i ~/.ssh/AlexKeyPair.pem ec2-user@$EC2_IP << EOF
  cd ~/n8n
  docker compose down || true
  docker compose up -d
EOF
