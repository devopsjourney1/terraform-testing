module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"

  name = "my-vpc"
  cidr = "172.16.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["172.16.1.0/24", "172.16.2.0/24"]
  public_subnets  = ["172.16.101.0/24", "172.16.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
