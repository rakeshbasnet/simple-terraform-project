# Terraform S3 Static Website Hosting

This Terraform project provisions an Amazon S3 bucket, configures it for static website hosting, and uploads necessary files like `index.html`, `error.html`, and `profile.jpeg`. The project also sets up public access and proper ownership controls for the S3 bucket.

## Prerequisites

Before you begin, ensure that you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12+)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with your AWS credentials)
- An AWS account with appropriate IAM permissions to create resources such as S3 buckets.

## Project Structure

The project contains the following files:
```bash
    .
    ├── .gitignore             # Git ignore file to exclude unnecessary files
    ├── error.html             # Custom error page for the website
    ├── index.html             # Homepage of your static website
    ├── main.tf                # Terraform configuration for the S3 bucket and website
    ├── outputs.tf             # Defines the output values after applying the Terraform script
    ├── profile.jpeg           # Example image for the static website
    ├── provider.tf            # AWS provider configuration
    ├── variables.tf           # Input variables for the project
    └── README.md              # Project documentation (this file)
```
## Steps
Follow these steps to set up the Terraform project and deploy the S3 static website hosting.

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clonehttps://github.com/rakeshbasnet/simple-terraform-project.git
cd simple-terraform-project
```
### 2. Configure AWS Credentials
Make sure your AWS credentials are properly configured. If you haven't already, you can configure them using the AWS CLI:
```bash
aws configure
```
Alternatively, you can set your AWS credentials using environment variables:
```bash
export AWS_ACCESS_KEY_ID="your_access_key_id"
export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
export AWS_DEFAULT_REGION="your_region"
```

### 3. Initialize Terraform
Run the following command to initialize Terraform, which will download the necessary provider plugins:
```bash
terraform init
```

### 4. Review and Modify Configuration
In variables.tf, you can modify the default values for the bucket name and region.
```bash
variable "bucketName" {
  description = "The name of the S3 bucket"
  default     = "my-unique-static-website-bucket"
}

variable "region" {
  description = "The AWS region where the bucket will be created"
  default     = "us-east-1"
}
```
Make sure the bucket name is globally unique.

### 5. Plan the Deployment
Run the following command to create an execution plan. This will show you what resources Terraform will create:
```bash
terraform plan
```
Review the output and make sure everything looks correct.

### 6. Apply the Configuration
Once you're satisfied with the plan, apply the configuration to create the resources in AWS:
```bash
terraform apply
```
Terraform will prompt you to confirm that you want to create the resources. Type yes to proceed.

### 7. Upload Website Files
Once the resources are created, the following files will be uploaded to the S3 bucket:

- index.html: The homepage of the website.
- error.html: A custom error page.
- profile.jpeg: An image for the website.

Terraform will automatically upload these files during the terraform apply step.

### 8. Access the Website
After running terraform apply, Terraform will output the website URL for accessing your hosted website beacuse we have defirned the output value for website url in outputs.tf file:
```bash
website_url = "http://test-bucket-for-terraform-project-2025.s3-website-us-east-1.amazonaws.com"
```

### 9. Cleanup
To destroy the resources and clean up after deployment, use the following command:

```bash
terraform destroy
```
Confirm by typing yes when prompted.

## Troubleshooting
- Ensure your AWS credentials are properly configured.
- Verify that the S3 bucket name is globally unique.
- Check if the files have the correct permissions and are publicly accessible.
