
#Variables with value in Terraform cloud
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "instance_type" {}
variable "naming_prefix" {
  type = string
}
variable "organization" {
  type = string
  
}
variable "ami_owner_account_id" {
  type = string
}
#
variable "vpc_cidr_main" {
  type          = string
  default = "10.1.0.0/16"
}
variable "public_subnets_cidr_main" {
  type    = list(any)
  default = ["10.1.1.0/24"]
}
variable "vpc_cidr_peer" {
  type    = string
  default = "10.2.0.0/16"
}
variable "public_subnets_cidr_peer" {
  type    = list(any)
  default = ["10.2.1.0/24"]
}

variable "policy_name" {
  type    = string
  default = "demo-policy"
}
variable "bucket_name" {
  type    = string
  default = "ssa-c03-2023"

}

variable "ebs_device_name" {
  type    = string
  default = "/dev/xvda"
}
variable "ebs_block_device_size" {
  default = "50"
  type    = number
}
variable "ebs_volume_type" {
  default = "gp2"
  type    = string
}
variable "ebs_delete_ebs_encryption" {
  type    = bool
  default = true
}
variable "associate_public_ip" {
  type    = bool
  default = true
}
variable "ec2_check" {
  type    = bool
  default = false
}
variable "ec2_monitoring" {
  type    = bool
  default = true
}
variable "ec2_ebs_optimized" {
  type    = bool
  default = true
}