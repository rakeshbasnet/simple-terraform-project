resource "aws_s3_bucket" "bucket" {                                         # Creates the S3 bucket.
  bucket = var.bucketName
}

resource "aws_s3_bucket_ownership_controls" "bucket_owner" {                # Ensures that the bucket owner has full control over the objects.
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {              # Configures public access settings for the bucket.
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {                                    # Applies the public-read ACL to the bucket.
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_owner,
    aws_s3_bucket_public_access_block.public_access,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index_file" {                                         # Uploads the index.html files to the bucket.
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error_file" {                                         # Uploads the error.html files to the bucket.
  bucket = aws_s3_bucket.bucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "profile_pic" {                                           # Uploads the profile.jpeg files to the bucket.
  bucket = aws_s3_bucket.bucket.id
  key = "profile.jpeg"
  source = "profile.jpeg"
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "my_portfolio" {                     # Configures the bucket for static website hosting with index.html as the homepage and error.html as the error page.
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.bucket_acl]
}