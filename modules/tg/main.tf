# -----------------------------------------------------------------------
# Target Group
# -----------------------------------------------------------------------
resource "aws_alb_target_group" "mod" {
  name                 = format("%s-tg", var.name)
  vpc_id               = var.vpc_id
  port                 = var.port
  protocol             = var.protocol
  target_type          = var.target_type
  deregistration_delay = var.deregistration_delay

  health_check {
    interval            = var.hc_interval
    path                = var.hc_path
    port                = var.hc_port
    protocol            = var.hc_protocol
    timeout             = var.hc_timeout
    unhealthy_threshold = var.hc_unhealthy_threshold
    matcher             = var.hc_matcher
  }
}

# -----------------------------------------------------------------------
# Attachment TargetGroup
# -----------------------------------------------------------------------
#----- AutoScaling
resource "aws_autoscaling_attachment" "mod" {
  count                  = var.attachment_asg ? 1 : 0
  autoscaling_group_name = var.asg_id
  alb_target_group_arn   = aws_alb_target_group.mod.arn
}

#----- EC2
resource "aws_alb_target_group_attachment" "mod" {
  count            = var.attachment_ec2 ? 1 : 0
  target_group_arn = aws_alb_target_group.mod.arn
  target_id        = var.instance_id
}

