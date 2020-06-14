# -----------------------------------------------------------------------
# Service
# -----------------------------------------------------------------------
module "worker_service" {
  source          = "./modules/ecs_service"
  name            = format("%s-worker", local.general_name)
  cluster         = aws_ecs_cluster.locust.id
  task_definition = module.worker_task.arn
  desired_count   = local.worker["desired_count"]

  network_configuration = {
    subnets          = module.subnet.public_subnets
    security_groups  = [module.worker_sg.id]
    assign_public_ip = true
  }
}

# -----------------------------------------------------------------------
# Task
# -----------------------------------------------------------------------
module "worker_task" {
  source                = "./modules/ecs_task"
  name                  = format("%s-worker", local.general_name)
  cpu                   = local.worker["cpu"]
  memory                = local.worker["memory"]
  container_definitions = data.template_file.worker.rendered
}

data "template_file" "worker" {
  template = file("./files/worker.json")

  vars = {
    name        = format("%s-worker", local.general_name)
    image       = local.locust["image"]
    script_path = local.locust["script_path"]
    cpu         = local.worker["cpu"]
    memory      = local.worker["memory"]
  }
}

# -----------------------------------------------------------------------
# Security Group
# -----------------------------------------------------------------------
module "worker_sg" {
  source = "./modules/sg"
  name   = format("%s-worker", local.general_name)
  tags   = local.tags
  vpc_id = module.vpc.vpc_id
}
