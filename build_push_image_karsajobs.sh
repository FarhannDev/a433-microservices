#!/bin/bash

# Set environment variables
GITHUB_USERNAME="farhanndev"
GITHUB_TOKEN="$CR_PAT"

IMAGE_NAME="karsajobs"
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
