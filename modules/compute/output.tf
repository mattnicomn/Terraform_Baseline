output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.instances[*].id
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.instances[*].public_ip
}

output "instance_private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = aws_instance.instances[*].private_ip
}

output "security_group_id" {
  description = "ID of the security group for compute instances"
  value       = aws_security_group.compute_sg.id
}

output "ami_id" {
  value = data.aws_ssm_parameter.latest_ami.value
  description = "The AMI ID being used for instances"
}

