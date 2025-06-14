locals {
  common_tags          = merge(var.tags, { Environment = var.env })
  private_subnets_tags = merge(local.common_tags, var.private_subnets.tags)
  public_subnets_tags  = merge(local.common_tags, var.public_subnets.tags)

  # private_subnets_tags = merge(local.tags, {
  #   "kubernetes.io/role/internal-elb"             = "1"
  #   "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  # })

  # public_subnets_tags = merge(local.tags, {
  #   "kubernetes.io/role/elb"                      = "1"
  #   "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  # })
}
