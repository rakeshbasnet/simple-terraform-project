# Variables for the terraorm configuration
variable "bucketName" {
  description = "The name of the S3 bucket"
  default = "test-bucket-for-terraform-project-2025"
}

variable "region" {
  description = "The AWS region where the bucket will be created"
  default = "us-east-1"
}