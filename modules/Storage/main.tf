resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
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

