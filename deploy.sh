#!/bin/bash

echo "🔐 Logging into DockerHub..."
docker login

echo "📦 Pushing images to DockerHub..."
docker push madhusudhan143/thinkboard-backend:prod
docker push madhusudhan143/thinkboard-frontend:prod

echo "🚀 Deploying services..."
docker compose -f docker-compose.yaml up -d

echo "✅ Deployed! Visit: http://<your-ec2-ip>"

