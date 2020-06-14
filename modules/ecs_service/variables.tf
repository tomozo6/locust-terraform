variable "name" {
  type    = string
  default = ""
}

variable "cluster" {
  type    = string
  default = ""
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "task_definition" {
  type    = string
  default = ""
}

variable "desired_count" {
  type    = string
  default = 1
}

variable "load_balancer" {
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = string
  })
  default = null
}

variable "network_configuration" {
  type = object({
    subnets          = list(string)
    security_groups  = list(string)
    assign_public_ip = string
  })
  default = null
}

variable "service_registries" {
  type = object({
    registry_arn = string
  })
  default = null
}
