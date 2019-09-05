resource "aws_s3_bucket" "generic_s3_bucket" {
  bucket = "${local.team-name}-s3-bucket"
  acl    = "private"

  # Enable versioning so we can see the full revision history of objects
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(
  local.common_tags,
  {
    app = local.team-name,
  }
  )

}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.generic_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


//resource "aws_s3_bucket_object" "file_upload" {
//  bucket = aws_s3_bucket.generic_s3_bucket.id
//  acl = "private"
//  key    = ""
//  source = "${path.module}/bucket_objects/"
//  etag   = "${filemd5("${path.module}/my_files.zip")}"
//}

resource "aws_s3_bucket_object" "upload_directory" {
  for_each = fileset(path.module, "bucket_objects/*")

  bucket = aws_s3_bucket.generic_s3_bucket.id
  key    = replace(each.value, "bucket_objects", "/")
  source = each.value
}