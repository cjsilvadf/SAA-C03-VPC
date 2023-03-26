###################################
## Virtual Machine Module - Main ##
###################################

# Create Elastic IP for the EC2 instance
resource "aws_eip" "linux-eip" {
  vpc  = true
  tags = local.common_tags
}

# Create EC2 Instance
resource "aws_instance" "main_linux-server" {
  ami                         = data.aws_ami.ubuntu-linux-2204.id
  instance_type               = local.sizes.micro
  subnet_id                   = element(module.vpc_main.public_subnets, 0)
  vpc_security_group_ids      = [module.sg_vpc_main.security_group_id]
  associate_public_ip_address = var.associate_public_ip
  source_dest_check           = var.ec2_check
  monitoring                  = var.ec2_monitoring
  ebs_optimized               = var.ec2_ebs_optimized
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("install_apache.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile_s3.name
  metadata_options {
    http_endpoint = "enable"
    http_tokens   = "required"
  }

  # root disk
  root_block_device {
    volume_size           = local.root_block_device.volume_size
    volume_type           = local.root_block_device.volume_type
    encrypted             = true
    delete_on_termination = local.root_block_device.delete_on_termination

  }
  # data disk
  ebs_block_device {
    device_name           = var.ebs_device_name
    volume_size           = var.ebs_block_device_size
    volume_type           = var.ebs_volume_type
    encrypted             = true
    delete_on_termination = var.ebs_delete_ebs_encryption
  }

  tags = merge(local.common_tags, { Name = "EC2-SAA-C03" }, )

}

# Associate Elastic IP to Linux Server
resource "aws_eip_association" "linux-eip-association" {
  instance_id   = aws_instance.main_linux-server.id
  allocation_id = aws_eip.linux-eip.id
}