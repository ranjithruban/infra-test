# Configure the Docker provider
variable "aws_ip_1" {
	
}

provider "docker" {
    host = "tcp://${var.aws_ip_1}:2375/"
}
