terraform {
  backend "s3" {
    bucket = "mybucket-1234567hcidcd"
    key    = "mybucket/s3/terraform.tfstate"
    region = "us-east-1"
  }
}