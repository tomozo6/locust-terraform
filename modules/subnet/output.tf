# -----------------------------------------------------------------------
# Subnet
# -----------------------------------------------------------------------
output "public_subnets" {
  value = [
    for subnet in aws_subnet.public :
    subnet.id
  ]
}

# -----------------------------------------------------------------------
# Route Table
# -----------------------------------------------------------------------
output "public_routetables" {
  value = [
    for routetable in aws_route_table.public :
    routetable.id
  ]
}
