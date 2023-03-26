#########################
# VPC B
#########################

module "vpc_peer" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.peer
  }

  name = "${local.name.vpc_name}-B"
  cidr = var.vpc_cidr_peer

  azs                  = [local.azs.peer_2a]
  public_subnets       = var.public_subnets_cidr_peer
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags


}
