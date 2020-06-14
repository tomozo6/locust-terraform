# -----------------------------------------------------------------------
# Security Group
# -----------------------------------------------------------------------
resource "aws_security_group" "mod" {
  name   = format("%s-sg", var.name)
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    map("Name", format("%s-sg", var.name))
  )
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.mod.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  description = "All egress traffic"
  type        = "egress"
}

resource "aws_security_group_rule" "ingress" {
  count             = length(var.ingress)
  security_group_id = aws_security_group.mod.id

  from_port                = var.ingress[count.index]["from_port"]
  to_port                  = var.ingress[count.index]["to_port"]
  protocol                 = var.ingress[count.index]["protocol"]
  description              = var.ingress[count.index]["description"]
  cidr_blocks              = var.ingress[count.index]["cidr_blocks"]
  source_security_group_id = var.ingress[count.index]["security_groups"]
  type                     = "ingress"
}
