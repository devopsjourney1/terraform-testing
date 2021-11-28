terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.13.4"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "TestVPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = ["us-west-2a", "us-west-2b"][0]

  tags = {
    Name = "Subnet1"
    Type = "Public"
  }
}

resource "aws_instance" "app_server" {
  #ami           = "ami-830c94e3"
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id

  tags = {
    Name = "MyInstance001"
  }
}