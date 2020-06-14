# -----------------------------------------------------------------------
# VPC
# -----------------------------------------------------------------------
resource "aws_vpc" "mod" {
  cidr_block                     = var.cidr
  instance_tenancy               = "default"
  enable_dns_hostnames           = "true"
  enable_dns_support             = "true"
  enable_classiclink             = "false"
  enable_classiclink_dns_support = "false"

  tags = merge(
    var.tags,
    map("Name", format("%s-vpc", var.name))
  )
}

# -----------------------------------------------------------------------
# Internet Gateway Setting
# -----------------------------------------------------------------------
resource "aws_internet_gateway" "mod" {
  vpc_id = aws_vpc.mod.id

  tags = merge(
    var.tags,
    map("Name", format("%s-igw", var.name))
  )
}
