# Define the S3 bucket resource
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# Define the S3 bucket ACL resource separately
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# Define the S3 bucket versioning resource separately
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S" # String type
  }
}

  hash_key = "LockID"

  tags = {
    Environment = "Terraform"
    Usage       = "State Locking"
  }
}

# Change DynamoDB if storing logs with similar data/files
#resource "aws_dynamodb_table" "example_table" {
#  name           = "example-table"
#  billing_mode   = "PAY_PER_REQUEST"
#  hash_key       = "PartitionKey"  # Partition Key
#  range_key      = "SortKey"       # Sort Key

#  attribute {
#    name = "PartitionKey"
#    type = "S"  # String type
#  }

#  attribute {
#    name = "SortKey"
#    type = "S"  # String type
#  }

  # Enable server-side encryption (optional)
#  server_side_encryption {
#    enabled = true
#  }

  # Enable point-in-time recovery (optional)
#  point_in_time_recovery {
#    enabled = true
#  }

#  tags = {
#    Environment = "production"
#    Owner       = "team"
#  }
#}
