
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu


    name          = var.vpc_subnet_name
  id_cidr_range = var.vpc_subnet_cidr
  region        = var.region
  network       = var.vpc_network_name


variable "project_id" {
  description = "The ID of the project in which the resources reside."
  type = string
}