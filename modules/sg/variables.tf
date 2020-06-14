variable "name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map
  default = {}
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "ingress" {
  type    = list
  default = []
}
