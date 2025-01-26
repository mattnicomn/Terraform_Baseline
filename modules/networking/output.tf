output "vpc_id" {
#  value = aws_vpc.main.id
  value = aws_vpc.main.id
}

#output "subnet_ids" {
#  value = aws_subnet.subnets[*].id
#}

output "subnet_ids" {
  description = "The IDs of the subnets created"
  value       = values(aws_subnet.subnets)[*].id
}


