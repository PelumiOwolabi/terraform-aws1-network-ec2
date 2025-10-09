provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

// Remote state configuration example
// Copy this block to envs/dev/ and envs/stage/ and update bucket/key/table
# backend "s3" {
#   bucket         = "<your-bucket-name>"
#   key            = "dev/terraform.tfstate"
#   region         = "us-east-1"
#   dynamodb_table = "<your-lock-table>"
#   encrypt        = true
# }
