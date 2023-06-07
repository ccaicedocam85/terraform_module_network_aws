resource "aws_vpc" "this" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = var.name_vpc
  }
}

resource "aws_subnet_app" "this" {
  vpc_id            = aws_vpc.this.id
  count             = length(var.subnets_app)
  cidr_block        = var.subnets_app[count.index].cidr_block
  availability_zone = var.subnets_app[count.index].availability_zone
  tags = {
    Name = var.subnets_app[count.index].name
  }
}

resource "aws_subnet_db" "this" {
  vpc_id            = aws_vpc.this.id
  count             = length(var.subnets_db)
  cidr_block        = var.subnets_db[count.index].cidr_block
  availability_zone = var.subnets_db[count.index].availability_zone
  tags = {
    Name = var.subnets_db[count.index].name
  }
}
