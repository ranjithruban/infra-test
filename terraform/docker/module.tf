# Configure the Docker provider
variable "aws_ip" {
	
}

provider "docker" {
    host = "tcp://${var.aws_ip}:2375/"
}
