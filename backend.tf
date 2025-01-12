terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "project-name/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

