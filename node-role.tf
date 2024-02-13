resource "aws_iam_role" "tks-dev-eks-node-role" {
  name = "tks-dev-eks-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    name = "tks-dev-eks-node-role"
  }
}

resource "aws_iam_role_policy_attachment" "tks-eks-node-role-policy" {
  role       = aws_iam_role.tks-dev-eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
resource "aws_iam_role_policy_attachment" "tks-eks-node-ecr-policy" {
  role       = aws_iam_role.tks-dev-eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "tks-eks-node-cni-policy" {
  role       = aws_iam_role.tks-dev-eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}