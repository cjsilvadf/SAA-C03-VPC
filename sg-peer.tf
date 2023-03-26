module "sg_vpc_peer" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.peer
  }

  name        = "SG-VPC-PEER"
  description = "Security group for service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc_peer.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp", "ssh-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8009
      to_port     = 8010
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.1.0.0/16"
    },
  ]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
