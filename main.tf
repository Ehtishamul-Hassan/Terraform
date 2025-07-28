provider "aws" {
  region = var.region
}

# Get default VPC and SG
data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

# Loop over instances
module "ec2_instances" {
  for_each          = var.instances
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  name              = each.value.name
  subnet_tag        = each.value.tag
  security_group_id = data.aws_security_group.default.id
  key_name          = var.key_name
}
