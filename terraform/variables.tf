variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

// terraform/main.tf
module "vpc" {
  source = "./vpc"
}
