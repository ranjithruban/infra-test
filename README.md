## Infrastructure current setup 

```
*1 public subnet with internet gw
*1 alb with health check on /ping attached to 2 ec2 servers
*2 ec2 instance with 4 docker running
```

This docker setup is not perfect. Should probably add kubernetes/docker swarm which would bring scaling features automatically.

## How to deploy
Local testing in laptop can be done using docker-compose file inside docker folder. This have docker files to build the images and binaries. 

```
1) Build the images using `docker build` with the names mentioned in compose file.
2) Run docker-compose "sudo docker-compose -f docker-compose.yml up -d"
```

Production deployment on aws and the folder terraform have the code to deploy. Uses docker and aws provisoners in terraform.

## Requirements
setup aws config with access key and secret 
*https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
An s3 bucket `state-file-s3` is needed to save state file. 
docker images are uploaded to dockerhub
*Create key pair and variables.tf to that. 

```
1) plan and deploy aws instances using 
#terraform init 
#terraform plan -target=module.aws
#terraform apply -target=module.aws
2) plan and deploy first container
#terraform plan -target=module.docker
#terraform apply -target=module.docker
3) plan and deploy second container
#terraform plan -target=module.docker1
#terraform apply -target=module.docker1
```

The app should be running in port 80 of loadbalancer dns. It will also work if we only do step 1 and 2 and leave 3rd step.

## Future
* Jenkins pipeline job can be added which detects git push to master and deploys the terraform code.
* Environment like staging , qa and production can be added in terraform as variables and deploy it as needed. 
* Add a proper dns and ssl for loadbalancer
* Change to kubernetes/AWS EKS
