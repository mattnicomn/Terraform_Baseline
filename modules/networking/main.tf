resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Main VPC"
  }
}

#resource "aws_subnet" "subnets" {
#  count           = length(var.subnet_cidrs)
#  vpc_id          = aws_vpc.main.id
#  cidr_block      = var.subnet_cidrs[count.index]
#  availability_zone = data.aws_availability_zones.available.names[count.index]
#  tags = {
#    Name = "Subnet ${count.index}"
#  }
#}

resource "aws_subnet" "example" {
  for_each           = toset(var.aws_availability_zones)
  vpc_id             = var.vpc_id
  cidr_block         = cidrsubnet(var.subnet_cidrs, 8, index(var.aws_availability_zones, each.value))
  availability_zone  = each.value
}

