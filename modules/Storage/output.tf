output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  value       = aws_dynamodb_table.terraform_lock_table.name
}