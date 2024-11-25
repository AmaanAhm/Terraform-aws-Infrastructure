data "aws_vpc" "vpc" {
  state = "available"

  tags = {
    "Name" = var.vpc_name
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:${var.subnet_tag}"
    values = [var.subnet_tag_value]
  }

  filter {
    name   = "tag:env"
    values = [var.environment]
  }

  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}-${var.subnet_tag_value}-${var.az}"]
  }
}

resource "aws_instance" "server" {
  ami                         = var.image_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = concat([aws_security_group.server.id], var.list_of_extra_sg_ids)
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  availability_zone           = var.az
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  iam_instance_profile        = var.iam_instance_profile_name
  user_data                   = var.user_data

  volume_tags = {
    Name = "${var.custom_string}-${var.app_name}-${var.environment}"
  }

  tags = {
    Name = "${var.custom_string}-${var.app_name}-${var.environment}"
  }
}

resource "aws_security_group" "server" {
  description = "SG for ${var.app_name} ${var.environment} env"
  name        = "${var.custom_string}-${var.app_name}-${var.environment}"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    "Name" = "${var.custom_string}-${var.app_name}-${var.environment}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "server_sg_ssh" {
  count             = length(var.ssh_cidr_blocks_list) > 0 ? 1 : 0
  security_group_id = aws_security_group.server.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.ssh_cidr_blocks_list
}

resource "aws_security_group_rule" "server_sg_egress" {
  security_group_id = aws_security_group.server.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.egress_cidr_blocks
  ipv6_cidr_blocks  = ["::/0"]
}
