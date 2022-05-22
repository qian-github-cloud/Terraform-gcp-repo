

output "gce_instance_name" {
  value = google_compute_instance.gcp_instance.id
}

output "gce_instance_id" {
  value = google_compute_instance.gcp_instance.instance_id
}

output "gce_instance_self_link" {
  value = google_compute_instance.gcp_instance.self_link
}


output "gce_instance_nat_ip" {
  value = google_compute_instance.gcp_instance.network_interface.0.access_config.0.nat_ip
}
