output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The ID of the VPC"
  value       = module.vpc.public_subnets[*]
}