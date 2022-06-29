terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::779527285137:role/AWSdevopscerttaskrole"

  }
}


