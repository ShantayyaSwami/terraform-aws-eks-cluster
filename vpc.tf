resource "aws_vpc" "eks-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    name = "tks-dev-eks-cluster/vpc"
  }
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    name = "tks-dev-eks-cluster/igw"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
}
