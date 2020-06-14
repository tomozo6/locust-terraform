# -----------------------------------------------------------------------
# Tags
# -----------------------------------------------------------------------
variable "name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map
  default = {}
}

variable "tags_public" {
  type    = map
  default = {}
}

# -----------------------------------------------------------------------
# Network
# -----------------------------------------------------------------------
variable "vpc_id" {
  type    = string
  default = ""
}

variable "igw_id" {
  type    = string
  default = ""
}

# -----------------------------------------------------------------------
# Subnet
# -----------------------------------------------------------------------
variable "azs" {
  type    = list
  default = []
}

variable "public_cidr" {
  type    = list
  default = []
}
