Copy code
#!/bin/bash

# Set environment variables
export DOCKER_USERNAME="your_docker_username"
export DOCKER_PASSWORD="your_docker_password"

# Variabel untuk nama image yang akan dibuat
IMAGE_NAME="item-app"

# Versi dari image
IMAGE_VERSION="1.0.0"

# Jalankan perintah untuk membangun Docker image
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Jalankan perintah untuk login ke Docker Hub
echo "Logging in to Docker Hub..."
docker login  $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_USERNAME --password-stdin

# Tag image dengan nama pengguna Docker Hub
docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

# Push image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION