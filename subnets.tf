resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.eks-vpc.id
  count             = length(var.public-subnet-cidr)
  cidr_block        = var.public-subnet-cidr[count.index]
  availability_zone = local.azs[count.index]
  tags = {
    name = "tks-dev-eks-cluster/public-subnet-${count.index}"
    "kubernetes.io/role/elb" : 1
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.eks-vpc.id
  count             = length(var.private-subnet-cidr)
  cidr_block        = var.private-subnet-cidr[count.index]
  availability_zone = local.azs[count.index]
  tags = {
    name = "tks-dev-eks-cluster/private-subnet-${count.index}"
    "kubernetes.io/role/internal-elb" : 1
  }
}

