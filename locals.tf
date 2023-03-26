locals {
  name = {
    vpc_name = "VPC-SAA-C03"
  }
  ami = {
    id = "ami-00eeedc4036573771"
  }
  regions = {
    main = "us-west-2"
    peer = "us-east-2"
  }
  azs = {
    main_2a = "us-west-2a"
    peer_2a = "us-east-2a"
  }
  sizes = {
    micro = "t2.micro"
  }
}

locals {
  common_tags = {
    project = "Certification"
  }
}

locals {
  root_block_device = {
    volume_size           = "50"
    volume_type           = "gp3"
    delete_on_termination = true
  }
}
