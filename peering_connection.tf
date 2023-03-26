#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter
data "aws_caller_identity" "peer" {
  #depois alterar para aws.peer, alterar tb lá no providers
  provider = aws.peer
}
output "owner_id" {
  value = data.aws_caller_identity.peer.id
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {

  vpc_id        = module.vpc_main.vpc_id
  peer_vpc_id   = module.vpc_peer.vpc_id
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = local.regions.peer
  auto_accept   = false

  tags = {
    Name = "VPC_MAIN-TO-VPC_PEER"
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = "VPC_PEER-TO-VPC_MAIN"
    Side = "Accepter"
  }
}

resource "aws_route" "rt_main" {
  route_table_id = join("", module.vpc_main.public_route_table_ids)
  //route_table_id = "rtb-0288a94dc427b5df4"
  destination_cidr_block    = var.vpc_cidr_peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

}

resource "aws_route" "rt_peer" {
  provider       = aws.peer
  route_table_id = join("", module.vpc_peer.public_route_table_ids)
  //route_table_id = "rtb-0288a94dc427b5df4"
  destination_cidr_block    = var.vpc_cidr_main
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

}