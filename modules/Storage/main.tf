resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id

  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.main.arn}/*",
      aws_s3_bucket.main.arn
    ]

    principals {
      type        = "AWS"
      identifiers = var.allowed_principals
    }
  }
}
