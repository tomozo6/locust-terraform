variable "name" {
  type    = string
  default = ""
}

variable "network_mode" {
  type    = string
  default = "awsvpc"
}

variable "requires_compatibilities" {
  type    = list
  default = ["FARGATE"]
}

variable "cpu" {
  type    = string
  default = ""
}

variable "memory" {
  type    = string
  default = ""
}

variable "container_definitions" {
  type    = string
  default = ""
}
