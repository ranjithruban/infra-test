terraform {
  backend "s3" {
    bucket = "state-file-s3"
    key    = "terraform-test-app.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
