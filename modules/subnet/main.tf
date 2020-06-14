# -----------------------------------------------------------------------
# Subnet(Public)
# -----------------------------------------------------------------------
#-----Subnet
resource "aws_subnet" "public" {
  count             = length(var.public_cidr) > 0 ? length(var.public_cidr) : 0
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.tags,
    var.tags_public,
    map("Name", format("%s-public-subnet-%02d", var.name, count.index))
  )
}

#-----Route Table
resource "aws_route_table" "public" {
  count  = length(var.public_cidr) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    map("Name", format("%s-public-rt", var.name))
  )
}

#-----Attache RouteTable
resource "aws_route_table_association" "public" {
  count          = length(var.public_cidr) > 0 ? length(var.public_cidr) : 0
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.0.id
}

#-----DefaultGateway
resource "aws_route" "public" {
  count                  = length(var.public_cidr) > 0 ? 1 : 0
  route_table_id         = aws_route_table.public.0.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}
