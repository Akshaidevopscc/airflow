#!/bin/bash
source ../init.sh

set -e

# For public images, pull directly from Docker Hub
# No registry needed

if [ "$BUILD_NUMBER" == "" ]; then
   echo "BUILD_NUMBER is not defined! Please use pull.conf to define it. exiting!"
   exit
fi

# Extract base image name from Dockerfile
if [ -f Dockerfile ]; then
    BASE_IMAGE=$(grep "^FROM" Dockerfile | awk '{print $2}' | head -1)
    if [ -n "$BASE_IMAGE" ]; then
        echo "Pulling base image: $BASE_IMAGE"
        docker pull $BASE_IMAGE
        
        # Tag it with our image name
        docker tag $BASE_IMAGE $IMAGE
        if [ "$BUILD_NUMBER" != "latest" ]; then
            docker tag $BASE_IMAGE $IMAGE.$BUILD_NUMBER
        fi
        docker tag $BASE_IMAGE $IMAGE_LATEST
        
        echo "Tagged as: $IMAGE"
        docker images $IMAGE | head -2
    else
        echo "Could not find FROM in Dockerfile"
        exit 1
    fi
else
    echo "Dockerfile not found!"
    exit 1
fi

