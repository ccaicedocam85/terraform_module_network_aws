output "vpc_id" {
  #value = aws_vpc.this.id
  value = aws_vpc.this.id
}

output "aws_subnet_app" {
  value = aws_subnet_app.this.*.id
}

output "aws_subnet_db" {
  value = aws_subnet_db.this.*.id
}