output "s3_bucket_arn" {
  value       = aws_s3_bucket.generic_s3_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.generic_s3_bucket.bucket
  description = "The Name of the S3 bucket"
}

output "s3_bucket_aws_console_link" {
  description = "AWS Console link for the S3 bucket"
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.generic_s3_bucket.bucket}"
}


