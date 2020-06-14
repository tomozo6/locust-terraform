data "aws_availability_zones" "available" {}

locals {
  # -----------------------------------------------------------------------
  # Tags
  # -----------------------------------------------------------------------
  general_name = "locust"

  tags = {
    "created_by"   = "terraform"
    "general_name" = local.general_name
  }

  # -----------------------------------------------------------------------
  # Network
  # -----------------------------------------------------------------------
  vpc_cidr = "192.168.0.0/16"

  public_cidr = [
    "192.168.0.0/24",
    "192.168.1.0/24",
    "192.168.2.0/24"
  ]

  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2],
  ]

  # -----------------------------------------------------------------------
  # Locust
  # -----------------------------------------------------------------------
  locust = {
    image       = "tomozo6/locust:0.0.1"
    script_path = "/scripts/locustfile.py"
  }

  master = {
    cpu           = "256"
    memory        = "512"
    desired_count = 1
  }

  worker = {
    cpu           = "256"
    memory        = "512"
    desired_count = 2
  }
}
