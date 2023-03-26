resource "aws_vpc_endpoint" "ec2_s3" {
  vpc_id            = module.vpc_main.vpc_id
  
  service_name      = "com.amazonaws.us-west-2.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.vpc_main.public_route_table_ids
    tags = {
    Name = "OREGON-S3"
    Side = "Accepter"
  }

}