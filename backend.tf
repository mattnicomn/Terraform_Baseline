terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
##    key            = "Terraform_Baseline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    acl            = "private"
  }
}

