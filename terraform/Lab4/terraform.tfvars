#Giving Variables values
availability_zones = ["us-west-2a", "us-west-2b"]
cidr_block         = "172.16.0.0/16"

# App server Settings
app_server_ami = "ami-09889d8d54f9e0a0e"
app_server_instance_type = "t2.micro"
app_server_count = 1


#Control Server Settings
control_server_ami = "ami-09889d8d54f9e0a0e"
control_server_instance_type = "t2.micro"
control_server_count = 2