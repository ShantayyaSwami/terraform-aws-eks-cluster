resource "aws_eks_cluster" "tks-dev-eks-cluster" {
  name     = "tks-dev-eks-cluster"
  role_arn = aws_iam_role.eks-cluster-role.arn
  vpc_config {
    subnet_ids = [aws_subnet.public-subnet[0].id, aws_subnet.public-subnet[1].id, aws_subnet.private-subnet[0].id,
    aws_subnet.private-subnet[1].id]
  }
  tags = {
    name = "tks-dev-eks-cluster"
  }
  depends_on = [aws_iam_role_policy_attachment.tks-eks-cluster-role-policy]
}
