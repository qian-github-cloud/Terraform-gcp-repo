resource "google_compute_instance" "gcp_instance" {
  project      = var.project_id
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
    access_config {

    }
  }
  tags = var.tags
  #   metadata = var.metadata
  boot_disk {
    device_name = var.boot_disk_name
    auto_delete = var.auto_delete
    // image_name => project/family
    initialize_params {
      image = var.image_name
      size  = var.disk_size
      type  = var.disk_type
    }
  }
}

