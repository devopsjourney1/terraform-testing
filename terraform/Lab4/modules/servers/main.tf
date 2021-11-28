#resource "aws_key_pair" "my-ssh-key" {
#  key_name   = "my-ssh-key"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA67XNCXc6P7gHYSfJwem80K807NQSLmqVepLqtxu+Y10p/azQ/0gbkmubkltbSpVR389mO61RDrY8+AFmvDiXOR9BV/bhz3Kdu+AeqEZnLmDfhAF3EdaPnM11CnLjsGfhURujkFbWECB4h+XQiXd+VvLJHMxrOGdou25vFOoN+k1FZ58sHS78pGeGSKaeifH0AcxqXu/76h3Ttjpjnc/GMXUzate7uBOe46Lle91SVdt+u1R5Vu52sITrdnUkHXcwHdDXSEzHIRWdBIKydNB23q5ywhfU9nLE0JECmrP/jVDZKmuYdX6lg/2byxbHet+Pz/QiWIPYmU58lcByPIC/"
#}

#EC2 -> Key pairs -> Create key pair -> mykeypair .pem
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#key_name
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
#data "key_name" "mykeypair" {
#  most_recent = true

#  filter {
#    name   = "name"
#    values = "mykeypair"
#  }
#}

resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  count = var.server_count
  vpc_security_group_ids = var.security_group_ids
  #vpc_security_group_ids = [module.security.application_sg_id]
  associate_public_ip_address = true
  key_name         = "mykeypair"
  #key_name = data.aws_ami.ubuntu.id
  user_data = <<-EOF
#!/bin/bash
apt update
apt install software-properties-common -y
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible -y
hostnamectl set-hostname ${var.hostname_prefix}${count.index + 1}
git clone https://github.com/devopsjourney1/terraform-testing /home/ubuntu/devops
chown -R ubuntu:ubuntu /home/ubuntu/devops
  EOF
  tags = {
    Name = "${var.hostname_prefix}${count.index + 1}"
  }
}
