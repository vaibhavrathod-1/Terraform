terraform {
  backend "s3" {
    bucket = "ravi-bucket123"
    key    = "mybucket/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
