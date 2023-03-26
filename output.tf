output "ubuntu_2004_ami_id" {
  value = data.aws_ami.ubuntu-linux-2004.id
}
output "ubuntu_2204_ami_id" {
  value = data.aws_ami.ubuntu-linux-2204.id
}
output "public_route_table_ids" {
  value = module.vpc_main.public_route_table_ids
}
output "vpc_main_public_route_table_ids" {
  value = join("", module.vpc_main.public_route_table_ids)
}
output "vpc_peer_public_route_table_ids" {
  value = join("", module.vpc_peer.public_route_table_ids)
}
output "public_id" {
  value = join("", module.vpc_main.public_route_table_ids)
}
output "id_igw" {
  value = module.vpc_main.public_internet_gateway_route_id
}

