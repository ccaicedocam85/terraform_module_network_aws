resource "aws_vpc" "this" {
    cidr_block = var.cidr_block_vpc
    tags = {
        Name = var.name_vpc
  }
}

resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.cidr_block_sub_net
  availability_zone = var.availability_zone
}