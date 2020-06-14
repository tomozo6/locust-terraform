output "vpc_id" {
  value = aws_vpc.mod.id
}

output "vpc_cidr" {
  value = aws_vpc.mod.cidr_block
}

output "igw_id" {
  value = aws_internet_gateway.mod.id
}
