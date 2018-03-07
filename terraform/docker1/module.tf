# Configure the Docker provider
variable "aws_ip_2" {
	
}

provider "docker" {
    host = "tcp://${var.aws_ip_2}:2375/"
}
