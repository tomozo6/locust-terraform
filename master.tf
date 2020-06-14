# -----------------------------------------------------------------------
# Target Group
# -----------------------------------------------------------------------
module "master_tg" {
  source      = "./modules/tg"
  name        = local.general_name
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"
  port        = 8089
  hc_port     = 8089
}

# -----------------------------------------------------------------------
# Service
# -----------------------------------------------------------------------
module "master_service" {
  source          = "./modules/ecs_service"
  name            = format("%s-master", local.general_name)
  cluster         = aws_ecs_cluster.locust.id
  task_definition = module.master_task.arn
  desired_count   = 1

  load_balancer = {
    target_group_arn = module.master_tg.arn
    container_name   = format("%s-master", local.general_name)
    container_port   = 8089
  }

  network_configuration = {
    subnets          = module.subnet.public_subnets
    security_groups  = [module.master_sg.id]
    assign_public_ip = true
  }

  service_registries = {
    registry_arn = aws_service_discovery_service.master.arn
  }
}

# -----------------------------------------------------------------------
# Task
# -----------------------------------------------------------------------
module "master_task" {
  source                = "./modules/ecs_task"
  name                  = format("%s-master", local.general_name)
  cpu                   = local.master["cpu"]
  memory                = local.master["memory"]
  container_definitions = data.template_file.master.rendered
}

data "template_file" "master" {
  template = file("./files/master.json")

  vars = {
    name        = format("%s-master", local.general_name)
    image       = local.locust["image"]
    script_path = local.locust["script_path"]
    cpu         = local.master["cpu"]
    memory      = local.master["memory"]
  }
}

# -----------------------------------------------------------------------
# Security Group
# -----------------------------------------------------------------------
module "master_sg" {
  source = "./modules/sg"
  name   = format("%s-master", local.general_name)
  tags   = local.tags
  vpc_id = module.vpc.vpc_id

  ingress = [
    {
      from_port       = 8089
      to_port         = 8089
      protocol        = "tcp"
      description     = ""
      cidr_blocks     = null
      security_groups = module.alb_sg.id
    },
    {
      from_port       = 5557
      to_port         = 5558
      protocol        = "tcp"
      description     = ""
      cidr_blocks     = null
      security_groups = module.worker_sg.id
    }
  ]
}
