#!/bin/bash

USERNAME="madhusudhan143"
DEV_TAG="$USERNAME/mern-thinkboard-dev"

# Push both images into 'dev' repo
docker push $DEV_TAG-backend
docker push $DEV_TAG-frontend

echo "🚀 Pushed to Docker Hub: $DEV_TAG"

docker-compose up -d
