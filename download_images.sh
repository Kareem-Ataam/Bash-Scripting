#!/bin/bash
################
##This script downloads a set of images that their URLs are specified IMAGE_URLS 
################
IMAGE_URLS=(
"https://i.pinimg.com/originals/2c/a6/b7/2ca6b7cafcfd555e75c2b3cb9f39f5b7.jpg"
"https://s3-us-west-1.amazonaws.com/umbrella-blog-uploads/wp-content/uploads/2016/03/docker-logo.jpg"
"https://www.unixmen.com/wp-content/uploads/2017/06/docker-compose-logo.png"
)
IMAGES_DIRECTORY="images"

mkdir -p ~/$IMAGES_DIRECTORY

for ((i=0; i<${#IMAGE_URLS[@]}; i++)); do
	IMAGE_FILE=~/${IMAGES_DIRECTORY}/image_$((i+1))
	wget -q -O ${IMAGE_FILE} ${IMAGE_URLS[i]}
	echo "Downloaded: image_$((i+1))"
done
