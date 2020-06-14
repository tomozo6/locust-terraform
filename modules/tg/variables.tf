# -----------------------------------------------------------------------
# Tags
# -----------------------------------------------------------------------
variable "name" {
  type    = string
  default = ""
}

# -----------------------------------------------------------------------
# Target Group
# -----------------------------------------------------------------------
variable "vpc_id" {
  type    = string
  default = ""
}

variable "port" {
  type    = string
  default = "80"
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "deregistration_delay" {
  type    = string
  default = "300"
}

#----- TargetGroup(Health Check)
variable "hc_interval" {
  type    = string
  default = "10"
}

variable "hc_path" {
  type    = string
  default = "/"
}

variable "hc_port" {
  type    = string
  default = "80"
}

variable "hc_protocol" {
  type    = string
  default = "HTTP"
}

variable "hc_timeout" {
  type    = string
  default = "5"
}

variable "hc_unhealthy_threshold" {
  type    = string
  default = "2"
}

variable "hc_matcher" {
  type    = string
  default = "200"
}

# -----------------------------------------------------------------------
# Attachment TargetGroup
# -----------------------------------------------------------------------
#----- Autoscaling
variable "attachment_asg" {
  type    = string
  default = "false"
}

variable "asg_id" {
  type    = string
  default = ""
}

#----- EC2
variable "attachment_ec2" {
  type    = string
  default = "false"
}

variable "instance_count" {
  type    = string
  default = 0
}

variable "instance_id" {
  type    = string
  default = ""
}
