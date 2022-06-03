resource "google_compute_firewall" "dev" {
  name    = var.firewall_name
  network = var.network
  allow {
    protocol = "tcp"
    ports = [
      var.port,
    ]
  }
  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}
