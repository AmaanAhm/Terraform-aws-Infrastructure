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

resource "aws_security_group" "private_instance_sg" {
  name        = "${var.custom_string}-${var.app_name}-${var.az}"
  description = "Security group for private instance allowing SSH from jumphost"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.custom_string}-${var.app_name}-private-sg-${var.environment}"
  }
}


resource "aws_security_group_rule" "server_sg_ssh" {
  count             = length(var.ssh_cidr_blocks_list) > 0 ? 1 : 0
  security_group_id = aws_security_group.private_instance_sg.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.ssh_cidr_blocks_list
}

resource "aws_security_group_rule" "server_sg_egress" {
  security_group_id = aws_security_group.private_instance_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.egress_cidr_blocks
  ipv6_cidr_blocks  = ["::/0"]
}

resource "aws_instance" "private" {
  ami                         = var.image_id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  associate_public_ip_address = false
  key_name = "laravel-docker"
  vpc_security_group_ids      = [aws_security_group.private_instance_sg.id]  
  volume_tags = {
    Name = "${var.custom_string}-${var.app_name}-${var.environment}"
  }

  tags = {
    Name = "${var.custom_string}-${var.app_name}-${var.environment}"
  }
}

