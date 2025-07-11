#!/bin/bash

echo "🛠 Building Docker images with correct names..."
docker compose -f docker-compose.yaml build || { echo "Build failed"; exit 1; }

echo "✅ Images built successfully as:"
docker images | grep thinkboard

