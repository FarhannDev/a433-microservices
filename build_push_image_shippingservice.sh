#!/bin/bash
# Shell Scripting ini digunakan untuk membangun docker image ke repositori github packages
echo 'Welcome to Bash scripting!'

# Set environment variable
GITHUB_USERNAME="farhanndev"
GITHUB_TOKEN="$CR_PAT"
IMAGE_NAME="shipping-service"
IMAGE_VERSION="latest"

# Build Docker image for backend
echo "Build Docker image for backend..."
docker build -t ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION .

# Login to GitHub Packages
echo "Logging in to GitHub Packages..."
docker login ghcr.io -u $GITHUB_USERNAME -p $GITHUB_TOKEN

# Push image to GitHub Packages
echo "Pushing image to GitHub Packages..."
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION