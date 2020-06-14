resource "aws_ecs_cluster" "locust" {
  name = local.general_name
}
