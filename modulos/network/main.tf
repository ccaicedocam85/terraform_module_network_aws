resource "aws_vpc" "this" {
    cidr_block = var.cidr_block_vpc
    tags = {
        Name = var.name_vpc
  }
}

resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  count = length(var.subnets)
  cidr_block = var.subnets[count.index].cidr_block
  availability_zone = var.subnets[count.index].availability_zone
  tags = {
    Name = var.subnets[count.index].name
  }
}