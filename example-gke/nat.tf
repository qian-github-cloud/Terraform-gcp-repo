resource "google_compute_router_nat" "dev" {
    name = "dev-nat"
    router = google_computer_router.dev.name
    region = var.region
    source_subnetwork_ip_ranges_to_nat = ""
    nat_ip_allocate_option = "MANUAL_ONLY"

    subnetwork {
        name = google_compute_subnetwork.dev.id
        source_ip_ranges_to_nat = ["ALL_IP_RANGES"]

    }

    nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "dev" {
    name = "nat"
    address_type = "EXTERNAL"
    network_tier = "PREMIUM"
    depends_on = [google_project_service.compute]
}