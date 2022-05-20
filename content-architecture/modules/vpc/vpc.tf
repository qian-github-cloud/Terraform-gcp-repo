

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


output "vpc_network_name" {
  value = google_compute_network.vpc_network.id
}

output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
}


output "vpc_subnet_name" {
  value = google_compute_subnetwork.vpc_subnet.id
}

output "vpc_subnet_self_link" {
  value = google_compute_subnetwork.vpc_subnet.self_link
 
}
