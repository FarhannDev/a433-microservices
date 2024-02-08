Copy code
#!/bin/bash

# Set environment variables
export DOCKER_USERNAME="farhan18"

# Variabel untuk nama image yang akan dibuat
IMAGE_NAME="item-app"

# Versi dari image
IMAGE_VERSION="1.0.0"

# Jalankan perintah untuk membangun Docker image
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Jalankan perintah untuk login ke Docker Hub
echo "Logging in to Docker Hub..."
echo ./app/dockerpass.txt  | docker login -u $DOCKER_USERNAME --password-stdin

# Tag image dengan nama pengguna Docker Hub
docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

# Push image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION