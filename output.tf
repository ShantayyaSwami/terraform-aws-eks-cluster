output "cluster-endpoint" {
  value = aws_eks_cluster.tks-dev-eks-cluster.endpoint
}

output "vpc-id" {
  value = aws_vpc.eks-vpc.id
}

output "public-subnet" {
  value = var.public-subnet-cidr[*]
}

output "private-subnet" {
  value = var.private-subnet-cidr[*]
}

output "nat-gateway" {
  value = aws_nat_gateway.nat-gateway.id
}
