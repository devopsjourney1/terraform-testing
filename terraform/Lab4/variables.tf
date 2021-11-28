#Declaring variables

variable "availability_zones" {
  type = list(string)
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block. Example: 172.16.0.0/16"
}

variable "app_server_instance_type" {
  type        = string
  description = "Your EC2 instance type"
}

variable "control_server_instance_type" {
  type        = string
  description = "Your EC2 instance type"
}

variable "app_server_ami" {
  type        = string
  description = "The AMI ID of your AMI image"
}

variable "control_server_ami" {
  type        = string
  description = "The AMI ID of your AMI image"
}



variable "app_server_count" {
  type        = number
  description = "Number of ec2 appserver instances"
}


variable "control_server_count" {
  type        = number
  description = "Number of ec2 appserver instances"
}
