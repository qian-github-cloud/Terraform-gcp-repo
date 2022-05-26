

module "gce" {
  source        = "../"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  network       = var.network
  subnetwork    = var.subnetwork
}

