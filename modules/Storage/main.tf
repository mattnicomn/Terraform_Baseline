resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
  
  tags = {
    Name = var.bucket_name
  }
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

