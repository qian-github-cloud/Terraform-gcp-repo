module "route_nat" {
  source                             = "../"
  router_name                        = var.router_name
  region                             = var.region
  router_nat_name                    = var.router_nat_name
  network                            = var.network
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
}
