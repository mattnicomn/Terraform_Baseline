resource "aws_instance" "instances" {
  count         = length(var.instance_types)
  ami           = var.ami_id
  instance_type = var.instance_types[count.index]
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = merge(
    var.common_tags,
    {
      Name = "Instance-${count.index}"
    }
  )
}

resource "aws_security_group" "compute_sg" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id
  description = "Security group for compute instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "Compute-Security-Group"
    }
  )
}


