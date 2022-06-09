output "firewall_name" {
  value = google_compute_firewall.dev.id
}

output "firewall_self_link" {
  value = google_compute_firewall.dev.self_link
}
