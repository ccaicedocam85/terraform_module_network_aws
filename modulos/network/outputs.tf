output "vpc_ids" {
  #value = aws_vpc.this.id
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.this.*.id
}
