How to deploy.
local testing can be done using the folder docker. This have `docker compose` and docker files to build the images. 

1) Build the images using `docker build`
2) Run docker-compose to up the web app. `sudo docker-compose -f docker-compose.yml up -d`

1) deploy aws instances using 
`#terraform init 
#terraform plan -target=module.aws
#terraform apply -target=module.aws`
2) deploy first container
`#terraform plan -target=module.docker
#terraform apply -target=module.docker`
3) deploy second container

The app should be running in port 80 of loadbalancer dns.

* Jenkins pipeline job can be added which detects git push to master and deploys the same terraform code. 
* move this to gcp/aws eks
