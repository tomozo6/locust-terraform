# -----------------------------------------------------------------------
# Base
# -----------------------------------------------------------------------
variable "name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map
  default = {}
}

# -----------------------------------------------------------------------
# ALB
# -----------------------------------------------------------------------
variable "subnets" {
  type    = list
  default = []
}

variable "security_groups" {
  type    = list
  default = []
}

variable "internal" {
  type    = string
  default = false
}


variable "idle_timeout" {
  type    = string
  default = "60"
}

variable "enable_deletion_protection" {
  type    = string
  default = false
}


# -----------------------------------------------------------------------
# Listener
# -----------------------------------------------------------------------
#----- 80
variable "listener_80" {
  type    = string
  default = false
}

variable "target_group_arn" {
  type    = string
  default = ""
}

variable "listener_443" {
  type    = string
  default = false
}

variable "ssl_policy" {
  type    = string
  default = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

variable "certificate_arn" {
  type    = string
  default = ""
}

variable "add_certificate_arn" {
  type    = list
  default = []
}
