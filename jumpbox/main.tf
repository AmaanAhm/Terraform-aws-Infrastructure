resource "aws_key_pair" "ssh_key" {
  key_name   = var.custom_string
  public_key = var.ssh_public_key
}

module "jumpbox" {
  source = "../jumpbox/ec2"

  vpc_name                    = var.vpc_name
  app_name                    = var.app_name
  environment                 = var.environment
  image_id                    = var.image_id
  key_name                    = aws_key_pair.ssh_key.id
  instance_type               = var.instance_type_jumpbox
  az                          = var.az
  subnet_tag_value            = var.subnet_tag_value_public
  associate_public_ip_address = true
  ssh_cidr_blocks_list        = var.ssh_cidr_list
}

resource "aws_security_group_rule" "jumpbox_ssh_nat" {
  security_group_id = module.jumpbox.server_sg_id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  description = ""
  cidr_blocks = ["${data.aws_nat_gateway.nat_gateway.public_ip}/32"]
}

