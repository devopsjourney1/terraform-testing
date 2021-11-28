output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.app_server[*].private_ip
}
