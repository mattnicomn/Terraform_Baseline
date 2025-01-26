# terraform {
#  backend "s3" {
#    bucket         = "terraform-state-bucket"
#    key            = "Terraform_Baseline/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "terraform-lock-table"
#    acl            = "private"
#  }
#}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}