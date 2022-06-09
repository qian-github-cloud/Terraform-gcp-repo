output "health_check_self_link" {
  value = google_compute_health_check.dev.self_link
}


output "instance_group_manager" {
  value = google_compute_region_instance_group_manager.dev.instance_group
}
