#!/bin/sh

# This script will upload the given local images to a registry server ($registry is the default value).
# See: https://github.com/yeasy/docker_practice/blob/master/_local/push_images.sh
# Usage:  push_images image1 [image2...]
# Author: yeasy@github
# Create: 2014-09-23

#The registry server address where you want push the images into
registry=127.0.0.1:5000

### DO NOT MODIFY THE FOLLOWING PART, UNLESS YOU KNOW WHAT IT MEANS ###
echo_r () {
    [ $# -ne 1 ] && return 0
    echo -e "\033[31m$1\033[0m"
}
echo_g () {
    [ $# -ne 1 ] && return 0
    echo -e "\033[32m$1\033[0m"
}
echo_y () {
    [ $# -ne 1 ] && return 0
    echo -e "\033[33m$1\033[0m"
}
echo_b () {
    [ $# -ne 1 ] && return 0
    echo -e "\033[34m$1\033[0m"
}

usage() {
    sudo docker images
    echo "Usage: $0 registry1:tag1 [registry2:tag2...]"
}

[ $# -lt 1 ] && usage && exit

echo_b "The registry server is $registry"


image="${1}"
echo_b "Building $image..."
docker build -t $image .
echo_b "Uploading $image..."
#docker tag $image $registry/$image
#docker push $registry/$image
#docker rmi $registry/$image
echo_g "Done"
