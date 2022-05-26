module "vpc" {
  source                  = "../"
  project_id              = var.project_id
  vpc_network_name        = var.vpc_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu
  vpc_subnet_name         = var.vpc_subnet_name
  vpc_subnet_cidr         = var.vpc_subnet_cidr
  region                  = var.region
  network                 = module.vpc.vpc_network_id
}
