# -----------------------------------------------------------------------
# ALB
# -----------------------------------------------------------------------
resource "aws_alb" "mod" {
  name                       = format("%s-alb", var.name)
  security_groups            = var.security_groups
  subnets                    = var.subnets
  internal                   = var.internal
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.tags,
    map("Name", format("%s-alb", var.name))
  )
}

# -----------------------------------------------------------------------
# Listener_80
# -----------------------------------------------------------------------
resource "aws_alb_listener" "http" {
  count             = var.listener_80 ? 1 : 0
  load_balancer_arn = aws_alb.mod.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = var.target_group_arn
    type             = "forward"
  }
}

# -----------------------------------------------------------------------
# Listener_443
# -----------------------------------------------------------------------
resource "aws_alb_listener" "https" {
  count             = var.listener_443 ? 1 : 0
  load_balancer_arn = aws_alb.mod.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    target_group_arn = var.target_group_arn
    type             = "forward"
  }
}

#----- Option Cetificate
resource "aws_lb_listener_certificate" "mod" {
  count           = length(var.add_certificate_arn) > 0 ? length(var.add_certificate_arn) : 0
  listener_arn    = aws_alb_listener.https.0.arn
  certificate_arn = var.add_certificate_arn[count.index]
}
