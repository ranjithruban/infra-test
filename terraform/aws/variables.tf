variable "region" {
  default = "us-east-1"
}

variable "vpc-cidr" {
   default = "10.0.0.0/16"
}

variable "ami" {
  default = {
    us-east-1 = "ami-55ef662f"
    us-east-2 = "ami-2452275e" 
  }
}

variable "keyname" {
  default = "ranjith"
}

variable "instance_type" {
  default = "t2.micro"
}
