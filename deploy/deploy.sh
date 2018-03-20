#!/bin/bash

#build the binaries
make clean all

#build the docker images
cd build/

REGISTRY="test"

git_branch=`echo $BRANCH_NAME`
echo $git_branch
image_tag=`echo $SHORT_COMMIT`
echo $image_tag

for image in frontend quotes newsfeed static-assets; do
    echo "** Building docker image $image"
    image_name="$REGISTRY/test-infra/$image"
    image_id=`docker build -q --force-rm -f docker/$image/Dockerfile .`
    echo "** Tagging image id $image_id"
    docker tag $image_id $image_name:$image_tag
    docker tag $image_id $image_name:latest
    echo "** Pushing $image_name"
    #docker push $image_name:$image_tag >/dev/null
    #docker push $image_name:latest >/dev/null
    echo "** $image_name:latest pushed"
    echo "** $image_name:$image_tag pushed"
done
