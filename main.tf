provider "aws" {
  region = var.aws_region
}

module "network_module" {
  source = "./modules/network"

  aws_region          = var.aws_region
  availability_zone_a = var.availability_zone_a
}

module "eks_module" {
  source = "./modules/eks"

  cluster_name_dc     = var.cluster_name_dc
  subnet_id_dc_a      = module.network_module.subnet_id_dc_a
  availability_zone_b = var.availability_zone_b
  vpc_main_dc         = module.network_module.vpc_main_dc
}