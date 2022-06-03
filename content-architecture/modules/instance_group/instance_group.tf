resource "google_compute_instance_template" "dev" {
  name_prefix  = var.instance_template_name
  machine_type = var.machine_type
  disk {
    source_image = var.source_image
  }

  network_interface {
    network = var.network

  }
}

resource "google_compute_instance_group_manger" "dev" {
  name               = var.instance_group_manager_name
  base_instance_name = var.base_instance_name
  version {
    instance_template = google_compute_instance_template.dev.id
  }
  target_size = var.target_size
  zone        = var.zone
}

resource "google_compute_region_autoscaler" "dev" {
  name   = var.region_autoscaler_name
  region = var.region
  target = google_compute_instance_group_manger.dev.id
  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    cpu_utilization {
      target = var.target
    }
  }
}


resource "google_compute_health_check" "dev" {
  name = var.health_check_name
  tcp_health_check {
    port = var.port
  }
}

resource "google_compute_firewall" "dev" {
  name    = var.firewall_name
  network = var.network
  allow {
    protocol = "tcp"
    ports = [
      var.port,
    ]
  }
}

resource "google_compute_firewall" "dev" {
  
}