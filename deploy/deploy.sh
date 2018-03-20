#!/bin/bash

#build the binaries
make clean all

#build the docker images
REGISTRY="ranjith"

git_branch=`echo $BRANCH_NAME`
echo $git_branch
image_tag=`echo $SHORT_COMMIT`
echo $image_tag

sudo docker login --username=ranjithruban --password=fd1a384c-93d5-47a6-90b8-bbbecc9181e9

for image in frontend quotes newsfeed static-assets; do
    echo "** Building docker image $image"
    image_name="$REGISTRY/$image"
    image_id=`sudo docker build -q --force-rm -f docker/$image/Dockerfile .`
    echo "** Tagging image id $image_id"
    sudo docker tag $image_id $image_name:$image_tag
    sudo docker tag $image_id $image_name:latest
    echo "** Pushing $image_name"
    #docker push $image_name:$image_tag >/dev/null
    #docker push $image_name:latest >/dev/null
    echo "** $image_name:latest pushed"
    echo "** $image_name:$image_tag pushed"
done

#upload the image to ECR or docker registry

