resource "aws_s3_bucket" "rap_s3_bucket_website" {
  count = length(var.bucket_names)
  bucket   = var.bucket_names[count.index]
  acl = "private"
  tags = local.tags
}

resource "aws_s3_bucket_website_configuration" "rap_s3_bucket_website_configuration" {
  count = length(var.bucket_names)
  bucket   = aws_s3_bucket.rap_s3_bucket_website[count.index].bucket
  index_document  {
    suffix = "index.html"
  }
}

resource "aws_iam_role" "rap_s3_publish_role" {
  name = "rap-demo-s3-publish-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          AWS = [
            "*"
          ]
        }
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.rap_s3_publish_policy.arn]
  tags                = local.tags
}


resource "aws_iam_policy" "rap_s3_publish_policy" {
  name = "rap-demo-s3-publish-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:PutObject*"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}