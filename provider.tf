terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  # assume_role {
  #   role_arn = "arn:aws:iam::787631830319:role/eksClusterRole"
  # }
}