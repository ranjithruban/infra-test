Infrastructure current setup 

*1 public subnet
*1 internet gw
*1 alb for health check attached to ec2 servers
*2 ec2 instance with 4 docker running

This docker setup is not perfect. ECS was not added due to vendor lock. Should probably add kubernetes/docker swarm which would bring scaling features automatically.

How to deploy.
local testing can be done using the folder docker. This have `docker compose` and docker files to build the images. 

1) Build the 4 image using `docker build`
2) Run docker-compose to up the web app. `sudo docker-compose -f docker-compose.yml up -d`

Production deploy is done on aws and the folder terraform have the code to deploy. uses docker and aws provisoners.

Requirements
setup aws config with access key and secret 
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
An s3 bucket `state-file-s3` is needed to save state file. 

1) deploy aws instances using 
#terraform init 
#terraform plan -target=module.aws
#terraform apply -target=module.aws
2) deploy first container
#terraform plan -target=module.docker
#terraform apply -target=module.docker
3) deploy second container
#terraform plan -target=module.docker1
#terraform apply -target=module.docker1

The app should be running in port 80 of loadbalancer dns. It will also work if we only deploy container1 and leave 3rd step.

Future
* Jenkins pipeline job can be added which detects gut push to master and deploys the same terraform code. Take one ec2 down and and deploy ne code and then deploy 2nd node.

* environment like staging , qa and production can be added in terraform as variables and deploy it as needed. 

TODO
Add a proper dns and ssl for loadbalancer
Change to kubernetes/AWS EKS
