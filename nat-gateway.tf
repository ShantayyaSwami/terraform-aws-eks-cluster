resource "aws_eip" "eip" {
  tags = {
    name = "tks-deveks-cluster/eip"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet[0].id
  tags = {
    name = "tks-dev-eks-cluster/nat"
  }
}

