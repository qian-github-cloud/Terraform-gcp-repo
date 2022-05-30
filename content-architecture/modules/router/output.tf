output "router_name" {
  value = google_compute_router.router.id
}

output "router_link" {
  value = google_compute_router.router.self_link
}


output "router_nat_name" {
  value = google_compute_router_nat.nat.id
}

