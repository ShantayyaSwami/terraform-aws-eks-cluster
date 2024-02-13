resource "aws_eks_node_group" "tks-dev-eks-node-group" {
  cluster_name    = aws_eks_cluster.tks-dev-eks-cluster.name
  node_group_name = "tks-dev-eks-node-group"
  node_role_arn   = aws_iam_role.tks-dev-eks-node-role.arn
  subnet_ids      = aws_subnet.private-subnet[*].id
  scaling_config {
    max_size     = 5
    min_size     = 2
    desired_size = 3
  }
instance_types = ["t2.micro"]
  update_config {
    max_unavailable = 1
  }
  depends_on = [aws_iam_role_policy_attachment.tks-eks-node-role-policy,
    aws_iam_role_policy_attachment.tks-eks-node-ecr-policy,
  aws_iam_role_policy_attachment.tks-eks-node-cni-policy]
}