
output "application_server_public_ips" {
  description = "application instance public ips"
  value       = module.app_server.instance_public_ip
}

output "control_server_public_ips" {
  description = "control instance public ips"
  value       = module.control_server.instance_public_ip
}


output "application_server_private_ips" {
  description = "application instance public ips"
  value       = module.app_server.instance_private_ip
}

output "control_server_private_ips" {
  description = "control instance public ips"
  value       = module.control_server.instance_private_ip
}