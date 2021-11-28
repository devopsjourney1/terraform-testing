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

module "network" {
  source = "./modules/network"
}


module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}


module "app_server" {
  source = "./modules/servers"
  ami = var.app_server_ami
  instance_type = var.app_server_instance_type
  server_count = var.app_server_count
  subnet_id = module.network.public_subnets[0]
  security_group_ids = [module.security.application_sg_id]
  hostname_prefix = "App"
}

module "control_server" {
  source = "./modules/servers"
  ami = var.control_server_ami
  instance_type = var.control_server_instance_type
  server_count = var.control_server_count
  subnet_id = module.network.public_subnets[0]
  security_group_ids = [module.security.application_sg_id]
  hostname_prefix = "Control"
}

#https://github.com/mlabouardy/terraform-aws-labs/issues/1
resource "null_resource" "hostfile" {
  ##Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo \"[ec2-master]\" > hosts"
  }
  provisioner "local-exec" {
    command =  "echo 'hello world'"
  }
}