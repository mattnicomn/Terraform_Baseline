output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = subnet_cidrs.subnets[*].id
}

