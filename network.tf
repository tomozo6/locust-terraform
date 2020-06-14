# -----------------------------------------------------------------------
# VPC
# -----------------------------------------------------------------------
module vpc {
  source = "./modules/vpc"
  name   = local.general_name
  tags   = local.tags
  cidr   = local.vpc_cidr
}

# -----------------------------------------------------------------------
# Subnet
# -----------------------------------------------------------------------
module subnet {
  source      = "./modules/subnet"
  name        = local.general_name
  tags        = local.tags
  vpc_id      = module.vpc.vpc_id
  igw_id      = module.vpc.igw_id
  azs         = local.azs
  public_cidr = local.public_cidr
}
