#!/bin/bash

USERNAME="madhusudhan143"
DEV_TAG="$USERNAME/mern-thinkboard-dev"
PROD_TAG="$USERNAME/mern-thinkboard-prod"

# Build combined multi-service image (optional - not needed for compose)
# OR tag backend and frontend separately into dev if you're pushing both

docker build -t $DEV_TAG-backend ./backend
docker build -t $DEV_TAG-frontend ./frontend

echo "✅ Build complete"

