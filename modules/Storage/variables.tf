variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-terraform-bucket-mattnicomn-101"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "my-terraform-dynamodb-mattnicomn"
}