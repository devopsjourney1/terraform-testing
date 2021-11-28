output "application_sg_id" {
  description = "Security group ID for application servers"
  value       = aws_security_group.appservers.id
}

output "control_sg_id" {
  description = "Security group ID for application servers"
  value       = aws_security_group.controlservers.id
}