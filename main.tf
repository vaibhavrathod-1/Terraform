resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "us-east-1b"
}

resource "aws_lb" "test" {
  name               = var.aws_lb_name
  internal           = false
  load_balancer_type = var.lb_type
  #subnets            = ["aws_subnet.public_subnet.id","aws_subnet.private_subnet.id"]
  subnet_mapping {
    subnet_id = aws_subnet.public_subnet.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.private_subnet.id
  }
  enable_deletion_protection = true
  access_logs {
    bucket  = aws_s3_bucket.bucket.id
    enabled = true
  }
  tags = {
    Environment = "production"
  }
}
