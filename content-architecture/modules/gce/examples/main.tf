

module "gce" {
  source             = "../"
  instance_name      = var.instance_name
  machine_type       = var.machine_type
  zone               = var.zone
  network            = var.network
  subnetwork         = var.subnetwork
  tags               = var.tags
  boot_disk_name     = var.boot_disk_name
  auto_delete        = var.auto_delete
  image_name         = var.image_name
  disk_size          = var.disk_size
  disk_type          = var.disk_type
  project_id         = var.project_id
  subnetwork_project = var.subnetwork_project
}

