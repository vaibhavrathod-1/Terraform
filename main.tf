resource "aws_eks_cluster" "cluster_project1" {
  name     = "cluster_project1"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster_project1.name
  node_group_name = "eks_node_group"
  node_role_arn   = var.role_arn
  subnet_ids      = var.subnet_ids
  
  remote_access {
  ec2_ssh_key = var.ec2_ssh_key
}

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  instance_types = var.instance_types

  update_config {
    max_unavailable = 1
  }
}

# add the s3 with alb
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}


resource "aws_lb" "test" {
  name               = var.aws_lb_name
  internal           = false
  load_balancer_type = var.lb_type
  #subnets            = ["aws_subnet.public_subnet.id","aws_subnet.private_subnet.id"]
  subnet_mapping {
    subnet_id = var.public_subnet.id
  }

  subnet_mapping {
    subnet_id = var.private_subnet.id
  }
  access_logs {
    bucket  = aws_s3_bucket.bucket.id
    enabled = true
  }
}


