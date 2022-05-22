

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.vpc_subnet_name
  id_cidr_range = var.vpc_subnet_cidr
  region        = var.region
  network       = var.vpc_network_name
}



