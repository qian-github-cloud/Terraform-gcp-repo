resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.network
}


resource "google_compute_router_nat" "nat" {
  name                               = var.router_nat_name
  region                             = var.region
  router                             = var.router_name
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
}
