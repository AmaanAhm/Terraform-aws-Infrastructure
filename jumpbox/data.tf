data "aws_vpc" "vpc" {
  state = "available"

  tags = {
    "Name" = var.vpc_name
  }
}

data "aws_nat_gateway" "nat_gateway" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-${var.az}"
  }
}
