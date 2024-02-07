Copy code
#!/bin/bash

# Variabel untuk nama image yang akan dibuat
IMAGE_NAME="item-app"

# Versi dari image
IMAGE_VERSION="1.0.0"

# Nama pengguna Docker Hub
DOCKERHUB_USERNAME="farhan18"

# Jalankan perintah untuk membangun Docker image
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Jalankan perintah untuk login ke Docker Hub
echo "Logging in to Docker Hub..."
docker login -u $DOCKERHUB_USERNAME

# Tag image dengan nama pengguna Docker Hub
docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

# Push image ke Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION