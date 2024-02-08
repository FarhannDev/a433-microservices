Copy code
#!/bin/bash

# Set environment variables
DOCKER_USERNAME="farhan18"
DOCKER_PASSWORD="2024dapatgelarskom"

# Variabel untuk nama image yang akan dibuat & Versi dari image
IMAGE_NAME="item-app"
IMAGE_VERSION="v1"

# Jalankan perintah untuk membangun Docker image
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Jalankan perintah untuk Melihat daftar image di lokal
docker images

# Jalankan perintah untuk mengubah Tag image dengan nama pengguna Docker Hub
docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

# Jalankan perintah untuk login ke Docker Hub
echo "Logging in to Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Jalankan perintah untuk Push image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_VERSION