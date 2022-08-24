variable "subnet_ids" {
  default = ["subnet-051247d5d1d9ee57e", "subnet-0407366a35afa8797"]
}



variable "ec2_ssh_key" {
  default = "eks-cluster"
}


variable "role_arn" {
  default = "arn:aws:iam::787631830319:role/eksClusterRole"
}
variable "name" {
  default = "AWSdevopscerttaskrole"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_id" {
  default = "vpc-079d5a058c5a7ea82"
}

variable "instance_types" {
  default = ["t3.medium"]
}


variable "vpn_cidr_block" {
  default = "10.0.0.0/16"

}

