resource "aws_iam_role" "role" {
  count       = length(var.role_names)
  name        = var.role_names[count.index]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

