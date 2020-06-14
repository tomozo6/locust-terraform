resource "aws_ecs_service" "mod" {
  name            = var.name
  cluster         = var.cluster
  launch_type     = var.launch_type
  task_definition = var.task_definition
  desired_count   = var.desired_count

  dynamic "load_balancer" {
    for_each = var.load_balancer == null ? [] : [var.load_balancer]
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  dynamic "network_configuration" {
    for_each = var.network_configuration == null ? [] : [var.network_configuration]
    content {
      subnets          = network_configuration.value.subnets
      security_groups  = network_configuration.value.security_groups
      assign_public_ip = network_configuration.value.assign_public_ip
    }
  }

  dynamic "service_registries" {
    for_each = var.service_registries == null ? [] : [var.service_registries]
    content {
      registry_arn = service_registries.value.registry_arn
    }
  }
}
