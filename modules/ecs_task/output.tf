output "arn" {
  value = aws_ecs_task_definition.mod.arn
}

output "family" {
  value = aws_ecs_task_definition.mod.family
}
