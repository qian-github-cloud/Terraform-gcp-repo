output "vpc_network_id" {
  value = google_compute_network.vpc_network.id
}

output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
}


output "vpc_subnet_name" {
  value = google_compute_subnetwork.vpc_subnet.id
}

output "vpc_subnet_self_link" {
  value = google_compute_subnetwork.vpc_subnet.self_link

}
