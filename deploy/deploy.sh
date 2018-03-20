#!/bin/bash

#build the binaries
make clean all

#build the docker images
REGISTRY="ranjith"

git_branch=`echo $BRANCH_NAME`
echo $git_branch
image_tag=`echo $SHORT_COMMIT`
echo $image_tag

sudo docker login -u ranjithruban -p ${password}

for image in frontend quotes newsfeed static-assets; do
    echo "** Building docker image $image"
    image_name="$REGISTRY/$image"
    image_id=`sudo docker build -q --force-rm -f docker/$image/Dockerfile .`
    echo "** Tagging image id $image_id"
    sudo docker tag $image_id $image_name:$image_tag
    sudo docker tag $image_id $image_name:latest
    echo "** Pushing $image_name"
    docker push $image_name:$image_tag
    docker push $image_name:latest
    echo "** $image_name:latest pushed"
    echo "** $image_name:$image_tag pushed"
done

#upload the image to ECR or docker registry
#echo "** Deploying to EC2"
#cd terraform
#echo "** Initialize Terraform state"
#[ -d .terraform ] && rm -rf .terraform
#[ -f terraform.tfstate.backup ] && rm terraform.tfstate.backup
#terraform init -force-copy

#echo "Git branch name is $git_branch"
#echo "** Plan and apply!"
#shortened_git_branch=`echo $BRANCH_NAME | head -c 32 | tr [A-Z] [a-z]`
#terraform plan -target=module.aws
#terraform apply -target=module.aws

#terraform plan -target=module.docker
#terraform apply -target=module.docker

#terraform plan -target=module.docker1
#terraform apply -target=module.docker1

#echo "** Revert local changes"
#git checkout -- .

