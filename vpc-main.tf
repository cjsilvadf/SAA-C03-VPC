#########################
# VPC A
#########################

module "vpc_main" {
  source = "terraform-aws-modules/vpc/aws"
  providers = {
    aws = aws
  }

  name = "${local.name.vpc_name}-A"
  cidr = var.vpc_cidr_main

  azs                  = [local.azs.main_2a]
  public_subnets       = var.public_subnets_cidr_main
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags

}
