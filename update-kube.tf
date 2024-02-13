resource "null_resource" "update-kubeconfig" {
  provisioner "local-exec" {
    when    = create
    command = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.tks-dev-eks-cluster.name}"
  }
}