
terraform { // settings block
  required_providers {
    aws = {
      source  = "hashicorp/aws" // reference to the terraform registry by default
      version = "~> 3.27"       // version constraint to avoid breaking changes
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {      // configures specificied provider
  profile = "default" // refers to aws credentials
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" { // component of the infrastucture: resource <type> <name>
  // creates a unique id for the resource -> aws_instance.app_server
  // arguments to configure the resource
  ami           = "ami-0000a24e0b08ea7c4" // ubuntu image
  instance_type = "t2.micro"     // aws free tier

  tags = {
    Name = var.instance_name // defined in variables.tf
  }
}