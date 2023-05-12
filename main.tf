resource "aws_vpc" "this" {
    cidr_block = var.cidr_block_ip4
    tags = {
        Name = var.name
  }
}