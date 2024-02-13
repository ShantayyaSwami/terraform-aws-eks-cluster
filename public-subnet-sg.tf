resource "aws_security_group" "public-subnet-sg" {
  vpc_id      = aws_vpc.eks-vpc.id
  description = "allow traffic to public subnet"
  dynamic "ingress" {
    for_each = var.inbound
    content {
      description      = "allow traffic on port ${ingress.value}"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    description      = "allow outgoing traffic from public subnet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

