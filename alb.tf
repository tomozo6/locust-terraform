# -----------------------------------------------------------------------
# ALB
# -----------------------------------------------------------------------
module "alb" {
  source           = "./modules/alb"
  name             = local.general_name
  tags             = local.tags
  subnets          = module.subnet.public_subnets
  security_groups  = [module.alb_sg.id]
  listener_80      = true
  target_group_arn = module.master_tg.arn
}

# -----------------------------------------------------------------------
# SecurityGroup
# -----------------------------------------------------------------------
module "alb_sg" {
  source = "./modules/sg"
  name   = format("%s-alb", local.general_name)
  tags   = local.tags
  vpc_id = module.vpc.vpc_id

  ingress = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      description     = ""
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = null
    }
  ]
}
